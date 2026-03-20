//
//  ViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class LoginViewController: UIViewController {

  let screen: LoginScreen = LoginScreen()
  let viewModel: LoginViewModel = LoginViewModel()

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
  }

  func configProtocols() {
    screen.delegate = self
    viewModel.delegate = self
  }

  func showAlertController(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okButton)
    present(alertController, animated: true)
  }
}

extension LoginViewController: LoginScreenProtocol {
  func tappedLoginButton() {
    let email = screen.emailTextField.text ?? ""
    let password = screen.passwordTextField.text ?? ""
    viewModel.login(email: email, password: password)
  }
  
  func tappedCreateAccountButton() {
    print(#function)
  }
}

extension LoginViewController: LoginViewModelProtocol {
  func loginDidFailure(message: String) {
     showAlertController(title: "Atenção", message: message)
  }
  
  func loginDidSucceed() {
    showAlertController(title: "Parabens!!", message: "login feito com sucesso :)")
  }
}

