//
//  RegisterScreen.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
  func tappedRegisterButton()
  func tappedBackButton()
}

class RegisterScreen: UIView {

  weak var delegate: RegisterScreenProtocol?

  lazy var logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "film")
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 26)
    label.text = "Criar conta"
    return label
  }()

  lazy var emailTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "E-mail"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    tf.autocapitalizationType = .none
    return tf
  }()

  lazy var passwordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Senha"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .default
    tf.autocapitalizationType = .none
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var confirmPasswordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Confirmar Senha"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .default
    tf.autocapitalizationType = .none
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Cadastrar-se", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
    return button
  }()

  lazy var backButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Voltar", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    button.setTitleColor(.blue, for: .normal)
    button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedRegisterButton() {
    delegate?.tappedRegisterButton()
  }

  @objc func tappedBackButton() {
    delegate?.tappedBackButton()
  }

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
    addSubview(logoImageView)
    addSubview(titleLabel)
    addSubview(emailTextField)
    addSubview(passwordTextField)
    addSubview(confirmPasswordTextField)
    addSubview(registerButton)
    addSubview(backButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
      logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 64),
      logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),

      titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 42),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
      passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
      confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      confirmPasswordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 26),
      registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      backButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
      backButton.centerXAnchor.constraint(equalTo: centerXAnchor),
    ])
  }
}
