//
//  MovieDetailServiceSwiftTests.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 21/05/26.
//

// Testing -> novo framework da apple para testes
import Testing
@testable import MasterCineProfessor

// em Swift test usamos agora todos os cenarios dentro de uma struct
struct MovieDetailServiceSwiftTests {
    //classe auxiliar para gerenciar dependencias e evidar duplicidade de codigo
    final class Dependencies {
        let spy = APIClientSpy()
        //necessario ser lazy pois estamos atribuindo um valor na classe onde esse valor tambem se inicializa na classe
        lazy var sut = MovieDetailService(apiClient: spy)
    }
    
    @Test("fetchMovieDetail when success should retrive movies details")
    func fetchMovieDetailWhenSuccessShouldRetriveMoviesDetails() async {
        // Given
        let dependencies = Dependencies()
        let expectedResponse = await MovieDetailResponse.mock
        dependencies.spy.result = .success(expectedResponse)
        
        // When
        // ação semelhante ao Task porem voltado aos testes
        await confirmation { confirmation in
            // necessario o await pois estamos simulando a chamada assincrona do metodo
            await dependencies.sut.fetchMovieDetail(id: 123) { result in
                // Then
                switch result {
                case .success(let response):
                    //expect é igual ao XCTAssert
                    #expect(response.title == expectedResponse.title)
                    #expect(response.overview == expectedResponse.overview)
                    #expect(response.runtime == expectedResponse.runtime)
                    #expect(response.releaseDate == expectedResponse.releaseDate)
                    #expect(response.voteAverage == expectedResponse.voteAverage)
                    #expect(response.id == expectedResponse.id)
                case .failure:
                    Issue.record("era pra dar sucesso poh ;-;")
                }
                //finaliza a espera assincrona
                confirmation()
            }
        }
    }
    
    @Test("fetchMovieDetail when failure should return invalid response")
    func fetchMovieDetailWhenFailureShouldReturnInvalidResponse() async {
        // Given
        let dependencies = Dependencies()
        dependencies.spy.result = .failure(.invalidResponse)
        
        // When
        await confirmation { confirmation in
            await dependencies.sut.fetchMovieDetail(id: 123) { result in
                // Then
                switch result {
                case .success:
                    Issue.record("O sucesso é uma falha aqui ;-;")
                case .failure(let error):
                    #expect(error == .invalidResponse)
                }
                confirmation()
            }
        }
    }
    
    @Test("fetchMovieDetail how many times should call APIClient")
    func fetchMovieDetailHowManyTimesShouldCallAPIClient() async {
        // Given
        let dependencies = Dependencies()
        let expectedResponse = await MovieDetailResponse.mock
        dependencies.spy.result = .success(expectedResponse)
        
        // When
        await confirmation { confirmation in
            await dependencies.sut.fetchMovieDetail(id: 123) { result in
                // Then
                switch result {
                case .success:
                    #expect(dependencies.spy.requestMethodCount == 1)
                case .failure:
                    Issue.record("era pra dar sucesso poh ;-;")
                }
                confirmation()
            }
        }
    }
}
