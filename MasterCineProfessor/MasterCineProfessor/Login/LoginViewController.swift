//
//  ViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class LoginViewController: UIViewController {

  let screen: LoginScreen = LoginScreen()

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
  }

  func configProtocols() {
    screen.delegate = self
  }
}

extension LoginViewController: LoginScreenProtocol {
  func tappedLoginButton() {
    print(#function)
  }
  
  func tappedCreateAccountButton() {
    print(#function)
  }
}

