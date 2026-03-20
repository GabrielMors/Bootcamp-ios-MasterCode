//
//  LoginViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 19/03/26.
//

import Foundation

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

    // TO DO: Criar request
    delegate?.loginDidSucceed()
  }
}
