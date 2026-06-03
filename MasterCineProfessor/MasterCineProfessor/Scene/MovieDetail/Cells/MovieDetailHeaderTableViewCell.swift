//
//  MovieDetailHeaderTableViewCell.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

final class MovieDetailHeaderTableViewCell: UITableViewCell {

  static let identifier = String(describing: MovieDetailHeaderTableViewCell.self)

  private lazy var headerView: MovieDetailHeaderView = {
    let view = MovieDetailHeaderView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
     contentView.addSubview(headerView)
  }

  private func configConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      headerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }

  func setupCell(headerData: HeaderViewData) {
    headerView.titleLabel.text = headerData.title
    headerView.subtitleLabel.text = headerData.subtitle

    if let posterURL = headerData.posterURL {
      headerView.posterImageView.downloadImage(urlString: posterURL)
    }

    if let backdropURL = headerData.backdropURL {
      headerView.backdropImageView.downloadImage(urlString: backdropURL)
    }
  }
}

