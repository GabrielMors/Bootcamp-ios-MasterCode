//
//  MovieDetailServiceTests.swift
//  MasterCineProfessorTests
//
//  Created by Marcello Pontes Domingos on 16/05/26.
//

import XCTest
@testable import MasterCineProfessor

final class MovieDetailServiceTests: XCTestCase {
    //ambiente 100% controlado, queremos crash em caso de algo fora do esperado
    private var sut: MovieDetailService!
    private var apiClientSpy: APIClientSpy!
    
    //Método de instanciação onde parametros são alimentados
    override func setUp() {
        super.setUp()
        
        apiClientSpy = APIClientSpy()
        sut = MovieDetailService(apiClient: apiClientSpy)
    }
    
    //Método oposto ao setUp com o foco de limpar as instancias
    override func tearDown() {
        sut = nil
        apiClientSpy = nil
        
        super.tearDown()
    }
    
    //testes são executados por métodos
    func test_fetchMovieDetail_whenRequestSucceeds_shouldReturnMovieDetail() {
        // Given
        let expectedResponse = self.getMovieDetailMock()
        apiClientSpy.result = .success(expectedResponse)
        
        // When
        sut.fetchMovieDetail(id: 123) { result in
            
            // Then
            switch result {
            case .success(let response):
                XCTAssertEqual(response.id, expectedResponse.id)
                
            case .failure:
                XCTFail("Expected success but received failure")
            }
        }
    }
    
    func test_fetchMovieDetail_whenRequestFails_shouldReturnError() {
        // Given
        apiClientSpy.result = .failure(.invalidResponse)

        // When
        sut.fetchMovieDetail(id: 123) { result in

            // Then
            switch result {
            case .success:
                XCTFail("Expected failure but received success")

            case .failure(let error):
                XCTAssertEqual(error, .invalidResponse)
            }
        }
    }
    
    func test_fetchMovieDetail_howManyTimes_shouldCallTheApiClient() {
        // Given
        let expectedResponse = self.getMovieDetailMock()
        apiClientSpy.result = .success(expectedResponse)
        
        // When
        sut.fetchMovieDetail(id: 123) { result in
            
            // Then
            switch result {
            case .success(_):
                XCTAssertEqual(self.apiClientSpy.requestMethodCount, 1)
                
            case .failure:
                XCTFail("Expected success but received failure")
            }
        }
    }
    
    private func getMovieDetailMock() -> MovieDetailResponse {
        MovieDetailResponse(
            id: 1,
            title: "Batman",
            overview: "Filme teste",
            runtime: 120,
            releaseDate: "2026-01-01",
            voteAverage: 8.5,
            posterPath: "/poster.jpg",
            backdropPath: "/backdrop.jpg",
            genres: [],
            credits: nil,
            videos: nil,
            recommendations: nil
        )
    }
}
