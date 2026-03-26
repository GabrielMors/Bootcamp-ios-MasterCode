//
//  RegisterViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import Foundation
import FirebaseAuth

public struct AuthFailure: LocalizedError {
  public let message: String
  public var errorDescription: String? { message }
  public init(_ message: String) { self.message = message }
}

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

    Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
      guard let self else { return }

      if let error = error {
        delegate?.registerDidFailure(message: mapFirebaseError(error).message)
      } else {
        delegate?.registerDidSucceed()
      }
    }
  }


  func mapFirebaseError(_ error: Error) -> AuthFailure {
   let nsError = error as NSError

   guard nsError.domain == AuthErrorDomain,
         let code = AuthErrorCode(rawValue: nsError.code) else {
     return AuthFailure("Não foi possível concluir a operação. Tente novamente.")
   }

   switch code {
   case .invalidEmail:
     return AuthFailure("Digite um e-mail válido.")
   case .wrongPassword, .userNotFound, .invalidCredential:
     return AuthFailure("E-mail ou senha incorretos.")
   case .emailAlreadyInUse:
     return AuthFailure("Esse e-mail já está em uso.")
   case .weakPassword:
     return AuthFailure("Sua senha é fraca. Use uma senha mais forte.")
   case .networkError:
     return AuthFailure("Sem conexão. Tente novamente.")
   case .tooManyRequests:
     return AuthFailure("Muitas tentativas. Aguarde um pouco e tente novamente.")
   case .userDisabled:
     return AuthFailure("Sua conta foi desativada.")
   case .operationNotAllowed:
     return AuthFailure("Operação não permitida no momento.")
   default:
     return AuthFailure("Não foi possível concluir a operação. Tente novamente.")
   }
 }
}
