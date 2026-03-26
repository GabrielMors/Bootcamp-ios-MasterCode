//
//  LoginViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 19/03/26.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
  func loginDidFailure(message: String)
  func loginDidSucceed()
}

class LoginViewModel {

  weak var delegate: LoginViewModelProtocol?

  func login(email: String, password: String) {
    guard Validator.isValidEmail(email) else {
      delegate?.loginDidFailure(message: "Digite um e-mail valido")
      return
    }

    guard Validator.isValidPassword(password) else {
      delegate?.loginDidFailure(message: "Digite uma senha valida")
      return
    }

    Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
      guard let self else { return }

      if let error = error {
        delegate?.loginDidFailure(message: error.localizedDescription)
      } else {
        delegate?.loginDidSucceed()
      }
    }
  }
}
