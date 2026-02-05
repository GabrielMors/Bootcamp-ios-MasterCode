//
//  ViewController.swift
//  Primeiro-app-Layout
//
//  Created by Gabriel Mors Pulga on 04/02/26.
//

import UIKit


//MARK: TODA UIViewController sempre tem uma UIView

class ViewController: UIViewController {

    @IBOutlet weak var nameGabriel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        nameGabriel.text = "Professor Gabriel"
        
    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        view.backgroundColor = .blue
    }
    
}

