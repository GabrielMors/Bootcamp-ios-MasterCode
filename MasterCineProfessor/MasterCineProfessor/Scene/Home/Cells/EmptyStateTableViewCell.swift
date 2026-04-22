//
//  EmptyStateTableViewCell.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {

  static let identifier = String(describing: EmptyStateTableViewCell.self)

  lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "film")
    imageView.tintColor = .black
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textAlignment = .center
    return label
  }()

  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.textAlignment = .center
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
    contentView.addSubview(descriptionLabel)
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

      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
  }

  func setupCell(title: String = "Sinto muito",
                 description: String = "Não encontramos oque você procurava...") {
    titleLabel.text = title
    descriptionLabel.text = description
  }
}
