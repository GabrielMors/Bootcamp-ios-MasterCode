//
//  MovieDetail.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

class MovieDetailViewController: UIViewController {

  let screen = MovieDetailScreen()
  let viewModel: MovieDetailViewModel

  init(movieId: Int) {
    viewModel = MovieDetailViewModel(movieId: movieId)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    title = "Detalhe do filme"
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
    viewModel.fetchMovieDetail()
  }

  func configProtocols() {
    screen.configTableViewProtocols(delegate: self, dataSource: self)
    viewModel.delegate = self
  }
}

extension MovieDetailViewController: MovieDetailViewModelProtocol {
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

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch viewModel.loadCurrentMovieDetail(at: indexPath.row) {
    case .header(let headerViewData):
      let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailHeaderTableViewCell.identifier) as? MovieDetailHeaderTableViewCell
      cell?.setupCell(headerData: headerViewData)
        cell?.accessibilityIdentifier = "movie_detail_header"
      return cell ?? UITableViewCell()
    case .overview(let description):
      let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.identifier) as? OverviewTableViewCell
      cell?.setupCell(description: description)
        cell?.accessibilityIdentifier = "movie_detail_overview"
      return cell ?? UITableViewCell()
    case .error(let message):
      let cell = tableView.dequeueReusableCell(withIdentifier: ErrorTableViewCell.identifier) as? ErrorTableViewCell
      cell?.setupCell(title: message)
        cell?.accessibilityIdentifier = "movie_detail_error"
      return cell ?? UITableViewCell()
    }
  }
}
