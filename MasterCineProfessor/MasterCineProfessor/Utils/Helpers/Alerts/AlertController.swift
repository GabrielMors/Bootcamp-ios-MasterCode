//
//  AlertController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 23/03/26.
//

import UIKit

struct AlertController {
  static func showConfirmAlertController(title: String, message: String, controller: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okButton)
    controller.present(alertController, animated: true)
  }
}
