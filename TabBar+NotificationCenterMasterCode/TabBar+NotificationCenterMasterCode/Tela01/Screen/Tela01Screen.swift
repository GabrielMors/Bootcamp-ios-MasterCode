//
//  Tela01Screen.swift
//  TabBar+NotificationCenterMasterCode
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

protocol Tela01ScreenProtocol: AnyObject {
  func tappedNameChangeButton(name: String)
}

class Tela01Screen: UIView {

  weak var delegate: Tela01ScreenProtocol?

  lazy var nameTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite seu nome:"
    tf.borderStyle = .roundedRect
    return tf
  }()

  lazy var nameChangeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.tintColor = .white
    button.setTitle("Alterar nome", for: .normal)
    button.addTarget(self, action: #selector(tappedNameChangeButton), for: .touchUpInside)
    return button
  }()
  
  @objc func tappedNameChangeButton() {
    let name = nameTextField.text ?? ""
    nameLabel.text = name
    delegate?.tappedNameChangeButton(name: name)
  }

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .orange
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(nameTextField)
    addSubview(nameLabel)
    addSubview(nameChangeButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
      nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

      nameChangeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
      nameChangeButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
      nameChangeButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
    ])
  }
}
