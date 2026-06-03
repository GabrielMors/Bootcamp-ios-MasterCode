//
//  MovieDetailScreen.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

final class MovieDetailScreen: UIView {

  private lazy var toast: MasterCineToastLabel = {
    let toast = MasterCineToastLabel()
    toast.configureView()
    toast.translatesAutoresizingMaskIntoConstraints = false
    return toast
  }()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.register(ErrorTableViewCell.self, forCellReuseIdentifier: ErrorTableViewCell.identifier)
    tableView.register(MovieDetailHeaderTableViewCell.self, forCellReuseIdentifier: MovieDetailHeaderTableViewCell.identifier)
    tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: OverviewTableViewCell.identifier)
    return tableView
  }()

  private lazy var likeButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    var config = UIButton.Configuration.filled()
    config.title = "Gostei do filme"
    config.image = UIImage(systemName: "hand.thumbsup.fill")
    config.imagePadding = 8
    button.configuration = config
    button.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    return button
  }()
    
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
    
  func reloadTableView() {
    tableView.reloadData()
  }
    
  @objc
  private func didTapLikeButton() {
    likeButton.isEnabled = false
    toast.showToast(message: "amei o filme papai") {
      self.likeButton.isEnabled = true
    }
  }

  private func addElements() {
    addSubview(tableView)
    addSubview(likeButton)
    addSubview(toast)
  }

  private func configConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),

      likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      likeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
      likeButton.heightAnchor.constraint(equalToConstant: 50),

      tableView.bottomAnchor.constraint(equalTo: likeButton.topAnchor, constant: -8),
      
      toast.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      toast.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      toast.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor),
      toast.heightAnchor.constraint(equalToConstant: 50),
    ])
  }
}
