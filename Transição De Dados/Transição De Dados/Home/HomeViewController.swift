//
//  HomeViewController.swift
//  Transição De Dados
//
//  Created by Gabriel Mors Pulga on 05/02/26.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        nameLabel.text = name
    }
    
}
