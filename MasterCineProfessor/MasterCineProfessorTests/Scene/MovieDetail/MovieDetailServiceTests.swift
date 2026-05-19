//
//  MovieDetailServiceTests.swift
//  MasterCineProfessorTests
//
//  Created by Marcello Pontes Domingos on 18/05/26.
//

import XCTest
@testable import MasterCineProfessor

final class MovieDetailServiceTests: XCTestCase {

//system under test -> classe que eu estou testando
//em testes unitarios o controle é 100% ou seja queremos um crash caso algo de errado
    private var sut: MovieDetailService!
//Spy -> Classe fake de teste onde validamos os parametros, retornos e comunicações do nosso sut
    private var spy: APIClientSpy!
    
//Metodo de instanciação onde parametros da classe de teste recebem valor
    override func setUp() {
        super.setUp()
        
        spy = APIClientSpy()
        sut = MovieDetailService(apiClient: spy)
    }
    
//Metodo oposto ao setUp, foco em remover valor dos parametros da classe de teste
    override func tearDown() {
        spy = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_fetchMovieDetail_whenRequestSucceeds_shouldReturnMovieDetail() {
        //Given -> Dado
        let expectedResponse = MovieDetailResponse.mock
        spy.result = .success(expectedResponse)
        
        //When -> Quando
        sut.fetchMovieDetail(id: 123) { result in
            //Then -> Então
            switch result {
            case .success(let response):
                XCTAssertEqual(response.title, expectedResponse.title)
                XCTAssertEqual(response.overview, expectedResponse.overview)
                XCTAssertEqual(response.runtime, expectedResponse.runtime)
                XCTAssertEqual(response.releaseDate, expectedResponse.releaseDate)
                XCTAssertEqual(response.voteAverage, expectedResponse.voteAverage)
                XCTAssertEqual(response.id, expectedResponse.id)
            case .failure:
                XCTFail("era esperado um sucesso e recebemos falha")
            }
        }
    }
    
    func test_fetchMovieDetail_whenRequestFails_shouldReturnInvalidResponse() {
        //Given
        spy.result = .failure(.invalidResponse)
        //When
        sut.fetchMovieDetail(id: 123) { result in
            //Then
            switch result {
            case .success:
                XCTFail("era esperado um erro e recebemos sucesso")
            case .failure(let error):
                XCTAssertEqual(error, .invalidResponse)
            }
        }
    }
    
    func test_fetchMovieDetail_howManyTimes_shouldCallTheApiClient() {
        //Given -> Dado
        let expectedResponse = MovieDetailResponse.mock
        spy.result = .success(expectedResponse)
        
        //When -> Quando
        sut.fetchMovieDetail(id: 123) { result in
            //Then -> Então
            switch result {
            case .success(_):
                XCTAssertEqual(self.spy.requestMethodCount, 1)
            case .failure:
                XCTFail("era esperado um sucesso e recebemos falha")
            }
        }
    }
}
