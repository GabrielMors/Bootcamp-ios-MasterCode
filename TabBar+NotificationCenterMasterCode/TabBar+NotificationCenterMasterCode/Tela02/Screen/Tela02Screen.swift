//
//  Tela02Screen.swift
//  TabBar+NotificationCenterMasterCode
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class Tela02Screen: UIView {
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
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
  
  func addElements() {
    addSubview(nameLabel)
  }
  
  func configConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
