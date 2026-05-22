//
//  MovieDetailViewModelSwiftTest.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 21/05/26.
//

import Testing
@testable import MasterCineProfessor

struct MovieDetailViewModelSwiftTest {

    struct Dependencies {
        let serviceSpy = MovieDetailServiceSpy()
        lazy var sut = MovieDetailViewModel(movieId: 123, service: serviceSpy)
    }
    

    @Test("fetchMovieDetail when success should create table values")
    func fetchMovieDetailWhenSuccessShouldCreateTableValues() async {
        // Given
        var dependencies = Dependencies()
        dependencies.serviceSpy.result = await .success(MovieDetailResponse.mock)
        
        // When
        await dependencies.sut.fetchMovieDetail()
        
        // Then
        #expect(await dependencies.sut.numberOfRowsInSection == 2)
        
        let headerRow = await dependencies.sut.rows.first
        
        switch headerRow {
        case .header(let header):
            #expect(header.subtitle == "2026 • 120 min • ⭐️ 8.5")
        default:
            Issue.record("era pra dar sucesso ;-;")
        }
    }
}

