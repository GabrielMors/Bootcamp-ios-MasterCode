//
//  HomeViewController.swift
//  LifeCycle
//
//  Created by Gabriel Mors Pulga on 09/02/26.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    @IBAction func tappedButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
