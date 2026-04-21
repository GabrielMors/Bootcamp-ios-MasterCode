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
      return UITableViewCell() // celula de error
    } else if viewModel.isEmptyMovie {
      return UITableViewCell() // celula de empty
    } else {
      return UITableViewCell() // celula de movie
    }
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


