//
//  HomeViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import Foundation

enum ShouldLoadNextPage: Int {
   case page = 3
}

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

  private var isLoadingPage: Bool = false
  private var currentPage: Int = 1
  private var totalPages: Int = 1
  private var currentQuery: String = ""

  private var hasMorePages: Bool {
    return currentPage < totalPages
  }

  func fetchPopularMovies() {
    currentQuery = ""
    currentPage = 1
    totalPages = 1
    isError = false
    fetchPopularMovies(page: currentPage, isPagination: false)
  }

  private func fetchPopularMovies(page: Int, isPagination: Bool) {
    guard !isLoadingPage else { return }

    isLoadingPage = true
    if !isPagination {
      delegate?.didChangeLoading(start: true)
    }

    service.fetchPopular(page: page) { [weak self] result in
      guard let self else { return }
      isLoadingPage = false
      delegate?.didChangeLoading(start: false)
      switch result {
      case .success(let success):
        currentPage = success.page
        totalPages = success.totalPages
        if !isPagination {
          movies = success.results
        } else {
          movies.append(contentsOf: success.results)
        }
        isError = false
      case .failure:
        isError = true
        if !isPagination {
          movies.removeAll()
        }
      }

      isInitialRequest = false
      delegate?.didUpdateMovies()
    }
  }

  private func fetchSearch(query: String) {
    currentPage = 1
    totalPages = 1
    isError = false
    currentQuery = query
    fetchSearch(query: query, page: currentPage, isPagination: false)
  }

  private func fetchSearch(query: String, page: Int, isPagination: Bool) {
    guard !isLoadingPage else { return }

    isLoadingPage = true
    if !isPagination {
      delegate?.didChangeLoading(start: true)
    }

    service.search(query: query, page: page) { [weak self] result in
      guard let self else { return }
      isLoadingPage = false
      delegate?.didChangeLoading(start: false)
      switch result {
      case .success(let success):
        currentPage = success.page
        totalPages = success.totalPages
        if !isPagination {
          movies = success.results
        } else {
          movies.append(contentsOf: success.results)
        }
        isError = false
      case .failure:
        isError = true
        if !isPagination {
          movies.removeAll()
        }
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

  func loadNextPageIfNeeded(index: Int) {
    guard !isError,
          !isEmptyMovie,
          !isLoadingPage,
          hasMorePages
          else { return }

    let lastIndex = movies.count - 1
    let shouldLoadNextPage = index >= lastIndex - ShouldLoadNextPage.page.rawValue

    guard shouldLoadNextPage else { return }

    let nextPage = currentPage + 1

    if currentQuery.isEmpty {
      fetchPopularMovies(page: nextPage, isPagination: true)
    } else {
      fetchSearch(query: currentQuery, page: nextPage, isPagination: true)
    }
  }
}
