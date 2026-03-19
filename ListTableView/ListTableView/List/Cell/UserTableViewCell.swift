//
//  UserTableViewCell.swift
//  ListTableView
//
//  Created by Gabriel Mors Pulga on 02/03/26.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  static let identifier: String = String(describing: UserTableViewCell.self)

  lazy var userImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  lazy var userName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupCell(user: User) {
    userImage.image = UIImage(systemName: user.image)
    userName.text = user.name
  }

  private func setupViews() {
    contentView.addSubview(userImage)
    contentView.addSubview(userName)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      userImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      userImage.heightAnchor.constraint(equalToConstant: 50),
      userImage.widthAnchor.constraint(equalToConstant: 50),

      userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
      userName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
}
