//
//  MovieDetailViewModelTests.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 20/05/26.
//


import XCTest
@testable import MasterCineProfessor

final class MovieDetailViewModelTests: XCTestCase {

    private var sut: MovieDetailViewModel!
    private var serviceSpy: MovieDetailServiceSpy!
    private var delegateSpy: MovieDetailViewModelDelegateSpy!

    override func setUp() {
        super.setUp()

        serviceSpy = MovieDetailServiceSpy()
        delegateSpy = MovieDetailViewModelDelegateSpy()

        sut = MovieDetailViewModel(
            movieId: 1,
            service: serviceSpy
        )

        sut.delegate = delegateSpy
    }

    override func tearDown() {
        sut = nil
        serviceSpy = nil
        delegateSpy = nil

        super.tearDown()
    }

    func test_fetchMovieDetail_whenSuccess_shouldCreateRows() {
        // Given
        serviceSpy.result = .success(MovieDetailResponse.mock)

        let expectation = expectation(description: "Fetch success")

        delegateSpy.didUpdateMoviesCompletion = {
            expectation.fulfill()
        }

        // When
        sut.fetchMovieDetail()

        // Then
        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.numberOfRowsInSection, 2)

        let firstRow = sut.loadCurrentMovieDetail(at: 0)

        switch firstRow {
        case .header(let data):
            XCTAssertEqual(data.title, "Batman")

        default:
            XCTFail("Expected header")
        }
    }

    func test_fetchMovieDetail_whenFailure_shouldCreateErrorRow() {
        // Given
        serviceSpy.result = .failure(.invalidResponse)

        let expectation = expectation(description: "Fetch failure")

        delegateSpy.didUpdateMoviesCompletion = {
            expectation.fulfill()
        }

        // When
        sut.fetchMovieDetail()

        // Then
        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.numberOfRowsInSection, 1)

        let row = sut.loadCurrentMovieDetail(at: 0)

        switch row {
        case .error:
            XCTAssertTrue(true)

        default:
            XCTFail("Expected error row")
        }
    }

    func test_fetchMovieDetail_shouldStartAndStopLoading() {
        // Given
        serviceSpy.result = .success(MovieDetailResponse.mock)

        let expectation = expectation(description: "Loading flow")

        delegateSpy.didUpdateMoviesCompletion = {
            expectation.fulfill()
        }

        // When
        sut.fetchMovieDetail()

        // Then
        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(delegateSpy.loadingStates, [true, false])
    }
}
