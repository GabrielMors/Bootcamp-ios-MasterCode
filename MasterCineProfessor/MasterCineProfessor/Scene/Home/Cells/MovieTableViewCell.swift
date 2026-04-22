//
//  MovieTableViewCell.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  static let identifier = String(describing: MovieTableViewCell.self)

  lazy var movieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 8
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.textAlignment = .left
    label.numberOfLines = 2
    return label
  }()

  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.textAlignment = .left
    label.numberOfLines = 2
    return label
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

  func addElements() {
     contentView.addSubview(movieImageView)
     contentView.addSubview(titleLabel)
     contentView.addSubview(descriptionLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      movieImageView.widthAnchor.constraint(equalToConstant: 84),
      movieImageView.heightAnchor.constraint(equalToConstant: 100),
      movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

      titleLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
      descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
    ])
  }

  func setupCell(movie: Movie) {
    titleLabel.text = movie.title
    descriptionLabel.text = buildDescription(movie: movie)

    if let urlString = movie.urlImage {
      movieImageView.downloadImage(urlString: urlString)
    }
  }

  func buildDescription(movie: Movie) -> String {
    var list: [String] = []

    if let releaseDate = movie.releaseDate {
      list.append("Release Date: \(releaseDate)")
    }
    
    if let voteAverage = movie.voteAverage {
      list.append("Vote Average: \(voteAverage)")
    }
    
    return list.joined(separator: " • ")
  }
}

