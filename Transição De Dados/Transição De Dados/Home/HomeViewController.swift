//
//  HomeViewController.swift
//  Transição De Dados
//
//  Created by Gabriel Mors Pulga on 05/02/26.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
//    var name: String = ""
    let name: String
    
    init?(coder: NSCoder, name: String) {
        self.name = name
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        nameLabel.text = name
    }
    
}
