//
//  MovieDetailViewModelTests.swift
//  MasterCineProfessorTests
//
//  Created by Marcello Pontes Domingos on 20/05/26.
//

import XCTest
@testable import MasterCineProfessor

final class MovieDetailViewModelTests: XCTestCase {
    private var sut: MovieDetailViewModel!
    private var serviceSpy: MovieDetailServiceSpy!
    
    override func setUp() {
        super.setUp()
        serviceSpy = MovieDetailServiceSpy()
        sut = MovieDetailViewModel(movieId: 123, service: serviceSpy)
    }
    
    override func tearDown() {
        sut = nil
        serviceSpy = nil
        super.tearDown()
    }
    
    func test_fetchMovieDetail_whenSuccess_shouldCreateTableValues() {
        // Given
        serviceSpy.result = .success(MovieDetailResponse.mock)

        // When
        sut.fetchMovieDetail()
        
        // Then
        XCTAssertEqual(sut.numberOfRowsInSection, 2)
    }
}
