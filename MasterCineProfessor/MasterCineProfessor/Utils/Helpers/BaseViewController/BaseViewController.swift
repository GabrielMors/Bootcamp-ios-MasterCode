//
//  BaseViewController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  func showAlertController(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okButton)
    present(alertController, animated: true)
  }
}
