//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeMasterCode
//
//  Created by Caio Fabrini on 12/02/26.
//

import UIKit

// MARK: - RECEITA DE BOLO VIEWCODE
// PASSO A PASSO

// 1 - Criar Screen (ex: LoginViewController -> LoginScreen. RegisterViewController -> RegisterScreen)
// 2 - Chamar construtor
// Exemplo:
// init() {
//  super.init(frame: .zero)
// }
//
// required init?(coder: NSCoder) {
//  fatalError("init(coder:) has not been implemented")
// }

// 3 - Crie o elemento e jamais se esqueça de configurar o translatesAutoresizingMaskIntoConstraints = false!!!
// 4 - Adicione o seu elemento na view
// 5 - Configurar constraints

class LoginScreen: UIView {

  lazy var loginLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Login"
    label.font = .systemFont(ofSize: 20, weight: .semibold)
    return label
  }()

  lazy var loginImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "person.circle")
    return imageView
  }()

  lazy var emailTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "E-mail"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    return tf
  }()

  lazy var passwordTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Senha"
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    return tf
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Não tem conta? Cadastre-se", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    return button
  }()

  @objc func didTapRegisterButton() {
    print("clicou aquiiii")
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
      addSubview(loginLabel)
      addSubview(loginImageView)
      addSubview(emailTextField)
      addSubview(passwordTextField)
      addSubview(registerButton)
  }

  // Atenção!!
  // NSLayoutConstraint.activate ele espera um array, sendo assim, para cada constraints no final vc precisa setar a virgula!!

  // Detalhes de cada tipo de constraints:
  // topAnchor -> Parte superior do elemento
  // bottomAnchor -> Parte inferior do elemento
  // leadingAnchor -> Parte lateral esquerda do elemento
  // trailingAnchor -> Parte lateral direita do elemento
  // OBS: a constant do trailingAnchor, deve ser sempre negativo!!

  func configConstraints() {
    NSLayoutConstraint.activate([
      loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      loginImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
      loginImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      loginImageView.heightAnchor.constraint(equalToConstant: 100),
      loginImageView.widthAnchor.constraint(equalToConstant: 100),

      emailTextField.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 35),
      emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
      registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      registerButton.heightAnchor.constraint(equalToConstant: 42),




    ])
  }
}
