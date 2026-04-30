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
  func loading(start: Bool)
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

    delegate?.loading(start: true)
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
      guard let self else { return }
      delegate?.loading(start: false)
      if let error = error {
        delegate?.loginDidFailure(message: error.localizedDescription)
      } else {
        UserDefaultsManager.shared.save(email, forKey: UserDefaultsKey.email)
        delegate?.loginDidSucceed()
      }
    }
  }
}
