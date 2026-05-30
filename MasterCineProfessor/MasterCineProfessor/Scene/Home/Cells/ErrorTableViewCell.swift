//
//  ErrorTableViewCell.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

class ErrorTableViewCell: UITableViewCell {

  static let identifier = String(describing: ErrorTableViewCell.self)

  lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "exclamationmark.triangle")
    imageView.tintColor = .black
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textAlignment = .center
    label.numberOfLines = 0
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
     contentView.addSubview(iconImageView)
     contentView.addSubview(titleLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      iconImageView.widthAnchor.constraint(equalToConstant: 100),
      iconImageView.heightAnchor.constraint(equalToConstant: 100),

      titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
  }

  func setupCell(title: String = "Ops, algo deu errado") {
    titleLabel.text = title
  }
}

