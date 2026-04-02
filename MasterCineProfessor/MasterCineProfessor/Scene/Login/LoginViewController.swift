//
//  ViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class LoginViewController: BaseViewController {

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
}

extension LoginViewController: LoginScreenProtocol {
  func tappedLoginButton() {
    let email = screen.emailTextField.text ?? ""
    let password = screen.passwordTextField.text ?? ""
    viewModel.login(email: email, password: password)
  }

  func tappedCreateAccountButton() {
    navigationController?.pushViewController(RegisterViewController(), animated: true)
  }
}

extension LoginViewController: LoginViewModelProtocol {
  func loading(start: Bool) {
    if start {
      LoadingLottie.start()
    } else {
      LoadingLottie.stop()
    }
  }
  
  func loginDidFailure(message: String) {
    showAlertController(title: "Atenção", message: message)
  }

  func loginDidSucceed() {
    showAlertController(title: "Parabens!!", message: "login feito com sucesso :)")
  }
}
