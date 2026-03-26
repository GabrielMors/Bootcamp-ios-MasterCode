//
//  LoginScreen.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
  func tappedLoginButton()
  func tappedCreateAccountButton()
}

class LoginScreen: UIView {
  
  weak var delegate: LoginScreenProtocol?
  
  lazy var logoImageView: UIImageView = {
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
    label.font = UIFont.boldSystemFont(ofSize: 28)
    label.text = "MasterCine"
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
    tf.isSecureTextEntry = true
    tf.autocapitalizationType = .none
    return tf
  }()
  
  lazy var loginButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Entrar", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    return button
  }()
  
  lazy var createAccountButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Não tem conta? Criar conta", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(tappedCreateAccountButton), for: .touchUpInside)
    return button
  }()
  
  @objc func tappedLoginButton() {
    delegate?.tappedLoginButton()
  }
  
  @objc func tappedCreateAccountButton() {
    delegate?.tappedCreateAccountButton()
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
    addSubview(loginButton)
    addSubview(createAccountButton)
  }
  
  func configConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
      logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: 100),
      logoImageView.heightAnchor.constraint(equalToConstant: 100),
      
      titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 40),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
      passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14),
      loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
      loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),

      createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8),
      createAccountButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
      createAccountButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
    ])
  }
}
