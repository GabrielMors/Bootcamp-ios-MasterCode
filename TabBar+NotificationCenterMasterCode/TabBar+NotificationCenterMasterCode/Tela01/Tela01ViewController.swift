//
//  ViewController.swift
//  TabBar+NotificationCenterMasterCode
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class Tela01ViewController: UIViewController {
  var screen: Tela01Screen = Tela01Screen()

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

extension Tela01ViewController: Tela01ScreenProtocol {
  func tappedNameChangeButton(name: String) {
    // Estou gritando changeName!!!
    NotificationCenter.default.post(name: .changeName, object: name)
  }
}
