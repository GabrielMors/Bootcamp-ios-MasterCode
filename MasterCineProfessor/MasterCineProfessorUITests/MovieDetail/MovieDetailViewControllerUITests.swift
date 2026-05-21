//
//  MovieDetailViewControllerUITests.swift
//  MasterCineProfessorUITests
//
//  Created by Marcello Pontes Domingos on 20/05/26.
//

import XCTest

final class MovieDetailViewControllerUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["UI_TEST"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        
        super.tearDown()
    }
    
    func test_movieDetailScreen_shouldDisplayNavigationTitle() {
        
        // Given
        let firstMovieCell = app.cells["movie_cell"].firstMatch
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 10))
        
        // When
        firstMovieCell.tap()
        
        // Then
        let navigationBar = app.navigationBars.firstMatch
        
        XCTAssertTrue(navigationBar.waitForExistence(timeout: 10))
    }
    
    func test_movieDetailScreen_shouldDisplayTableView() {
        
        // Given
        let firstMovieCell = app.cells["movie_cell"].firstMatch
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 10))
        
        // When
        firstMovieCell.tap()
        
        // Then
        let tableView = app.tables.firstMatch
        
        XCTAssertTrue(tableView.waitForExistence(timeout: 10))
    }
    
    func test_movieDetailScreen_shouldDisplayMovieContent() {
        
        // Given
        let firstMovieCell = app.cells["movie_cell"].firstMatch
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 10))
        
        // When
        firstMovieCell.tap()
        
        // Then
        let detailCell = app.cells["movie_detail_header_cell"]
        
        XCTAssertTrue(detailCell.waitForExistence(timeout: 10))
    }
    
    func test_movieDetailScreen_shouldScrollTableView() {
        
        // Given
        let firstMovieCell = app.cells["movie_cell"].firstMatch
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 10))
        
        // When
        firstMovieCell.tap()
        
        let tableView = app.tables.firstMatch
        
        XCTAssertTrue(tableView.waitForExistence(timeout: 10))
        
        tableView.swipeUp()
        
        // Then
        XCTAssertTrue(tableView.exists)
    }
}
//MasterCineProfessorUITests/MasterCineProfessorUITests-Bridging-Header.h
