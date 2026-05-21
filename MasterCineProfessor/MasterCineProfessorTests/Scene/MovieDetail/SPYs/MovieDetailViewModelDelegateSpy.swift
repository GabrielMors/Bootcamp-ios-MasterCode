//
//  MovieDetailViewModelDelegateSpy.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 20/05/26.
//


import Foundation
@testable import MasterCineProfessor

final class MovieDetailViewModelDelegateSpy: MovieDetailViewModelProtocol {

    var didUpdateMoviesCalled = false
    var loadingStates: [Bool] = []

    var didUpdateMoviesCompletion: (() -> Void)?

    func didUpdateMovies() {
        didUpdateMoviesCalled = true
        didUpdateMoviesCompletion?()
    }

    func didChangeLoading(start: Bool) {
        loadingStates.append(start)
    }
}