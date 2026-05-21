//
//  HomeViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import UIKit

class HomeViewController: UIViewController {
  var screen = HomeScreen()
  var viewModel = HomeViewModel()

  override func loadView() {
    title = "Home"
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
    viewModel.fetchPopularMovies()
  }

  func configProtocols() {
    screen.configSearchBarProtocol(delegate: self)
    screen.configTableViewProtocols(delegate: self,
                                    dataSource: self)
    viewModel.delegate = self
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if viewModel.isError {
      let cell = tableView.dequeueReusableCell(withIdentifier: ErrorTableViewCell.identifier) as? ErrorTableViewCell
      cell?.setupCell()
      return cell ?? UITableViewCell() // celula de error
    } else if viewModel.isEmptyMovie {
      let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier) as? EmptyStateTableViewCell
      cell?.setupCell()
      return cell ?? UITableViewCell() // celula de empty
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell
      cell?.setupCell(movie: viewModel.loadCurrentMovie(index: indexPath.row))
        cell?.accessibilityIdentifier = "movie_cell"
      viewModel.loadNextPageIfNeeded(index: indexPath.row)
      return cell ?? UITableViewCell() // celula de movie
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard !viewModel.isEmptyMovie &&
    !viewModel.isError &&
    RemoteConfigManager.shared.getBool(forKey: .showNewHome) else { return }
    let movie = viewModel.loadCurrentMovie(index: indexPath.row)
    let movieDetail = MovieDetailViewController(movieId: movie.id)
    navigationController?.pushViewController(movieDetail, animated: true)
  }
}

extension HomeViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard searchText.isEmpty else { return }
    viewModel.fetchPopularMovies()
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    viewModel.search(text: searchBar.text ?? "")
  }
}

extension HomeViewController: HomeViewModelProtocol {
  func didUpdateMovies() {
    screen.tableView.reloadData()
  }

  func didChangeLoading(start: Bool) {
    if start {
      LoadingLottie.start()
    } else {
      LoadingLottie.stop()
    }
  }
}


