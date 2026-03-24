//
//  RegisterViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import UIKit

// 1 - Crie a VC
// 2 - Crie a Screen
// 3 - Crie o layout
// 4 - Crie VM e parte logica

class RegisterViewController: UIViewController {

  var screen = RegisterScreen()
  var viewModel = RegisterViewModel()

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

extension RegisterViewController: RegisterScreenProtocol {
  func tappedRegisterButton() {
    let email = screen.emailTextField.text ?? ""
    let password = screen.passwordTextField.text ?? ""
    let confirmPassword = screen.confirmPasswordTextField.text ?? ""

    viewModel.registerUser(email: email,
                           password: password,
                           confirmPassword: confirmPassword)
  }

  func tappedBackButton() {
    navigationController?.popViewController(animated: true)
  }
}

extension RegisterViewController: RegisterViewModelProtocol {
  func registerDidFailure(message: String) {
    AlertController.showConfirmAlertController(title: "Error", message: message, controller: self)
  }

  func registerDidSucceed() {
    AlertController.showConfirmAlertController(title: "Sucesso", message: "cadastro concluido com sucesso", controller: self)
  }
}
