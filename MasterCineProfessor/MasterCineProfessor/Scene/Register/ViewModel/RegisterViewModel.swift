//
//  RegisterViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import Foundation

protocol RegisterViewModelProtocol: AnyObject {
  func registerDidFailure(message: String)
  func registerDidSucceed()
}

class RegisterViewModel {

  weak var delegate: RegisterViewModelProtocol?

  func registerUser(email: String, password: String, confirmPassword: String) {
    guard Validator.isValidEmail(email) else {
      delegate?.registerDidFailure(message: "Digite um e-mail valido")
      return
    }

    guard Validator.isValidPassword(password) else {
      delegate?.registerDidFailure(message: "Digite uma senha valida")
      return
    }

    guard password == confirmPassword else {
      delegate?.registerDidFailure(message: "Sua senha deve ser igual a sua senha de confirmação")
      return
    }

    delegate?.registerDidSucceed()
  }
}
