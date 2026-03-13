//
//  Tela02ViewController.swift
//  TabBar+NotificationCenterMasterCode
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class Tela02ViewController: UIViewController {
  var screen: Tela02Screen = Tela02Screen()

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    addObserver()
  }

  func addObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(changeName), name: .changeName, object: nil)
  }

  @objc func changeName(_ notification: NSNotification) {
    print("alterou o nome da tela 02")
    let text = notification.object as? String
    screen.nameLabel.text = text
  }
}
