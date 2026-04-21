//
//  HomeViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
  func didUpdateMovies()
  func didChangeLoading(start: Bool)
}

final class HomeViewModel {

  weak var delegate: HomeViewModelProtocol?
  private var service = HomeService()
  private var movies: [Movie] = []
  private(set) var isError: Bool = false
  private var isInitialRequest: Bool = true

  func fetchPopularMovies() {
    delegate?.didChangeLoading(start: true)
    service.fetchPopular(page: 1) { [weak self] result in
      guard let self else { return }
      delegate?.didChangeLoading(start: false)
      switch result {
      case .success(let success):
        movies = success.results
        isError = false
      case .failure:
        isError = true
        movies.removeAll()
      }
      isInitialRequest = false
      delegate?.didUpdateMovies()
    }
  }

  private func fetchSearch(query: String) {
    delegate?.didChangeLoading(start: true)
    service.search(query: query, page: 1) { [weak self] result in
      guard let self else { return }
      delegate?.didChangeLoading(start: false)
      switch result {
      case .success(let success):
        movies = success.results
        isError = false
      case .failure:
        isError = true
        movies.removeAll()
      }
      delegate?.didUpdateMovies()
    }
  }

  var numberOfRowsInSection: Int {
    guard !isInitialRequest else { return 0 }
    return (isError || isEmptyMovie) ? 1 : movies.count
  }

  var isEmptyMovie: Bool {
    return movies.isEmpty
  }

  func loadCurrentMovie(index: Int) -> Movie {
    return movies[index]
  }

  func search(text: String) {
    let query = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    if query.isEmpty {
      fetchPopularMovies()
      return
    }
    fetchSearch(query: query)
  }
}
