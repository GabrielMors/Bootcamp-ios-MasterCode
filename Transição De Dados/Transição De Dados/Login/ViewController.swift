//
//  ViewController.swift
//  Transição De Dados
//
//  Created by Gabriel Mors Pulga on 05/02/26.
//

import UIKit

class ViewController: UIViewController {

//    Ligações @IBOutlet Sào feitas para que possa ser utilizado/configurado as propriedade(caracteristicas) dos elementos
//    Ligações @IBOutlet SEMPRE são feitas acima dos métodos de ciclo de vida!!!!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdElements()
        configElements()
        isEnableLoginButton(isEnable: false)
    }

//    Ligações @IBAction representam AÇÃO DOS ELEMENTOS
//    OBS: As ligações @IBAction SEMPRE ficam abaixo dos métodos de ciclo de vida!!!!
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        view.backgroundColor = .red
        loginLabel.text = "Gabriel"
    }
    
    func createdElements() {
        configTextField(textField: emailTextField, placeholder: "Digite seu email:", keyboard: .emailAddress)
        configTextField(textField: passwordTextField, placeholder: "Digite sua senha:", keyboard: .default)
    }
    
    func configTextField(textField: UITextField, placeholder: String, keyboard: UIKeyboardType) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboard
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        
//        emailTextField.placeholder = "Digite seu email:"
//        emailTextField.keyboardType = .emailAddress
//        emailTextField.autocorrectionType = .no
//        emailTextField.borderStyle = .roundedRect
//
//        passwordTextField.placeholder = "Digite seu email:"
//        passwordTextField.keyboardType = .emailAddress
//        passwordTextField.autocorrectionType = .no
//        passwordTextField.borderStyle = .roundedRect
    }
    
    func configElements() {
        loginLabel.text = "Login"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        loginButton.setTitle("Entrar", for: .normal)
    }
    
    func isEnableLoginButton(isEnable: Bool) {
        loginButton.isEnabled = isEnable
        
//        if loginButton.isEnabled {
//            loginButton.backgroundColor = .systemBlue
//        } else {
//            loginButton.backgroundColor = .systemGray
//        }
        
//                                                  True           False
        loginButton.backgroundColor = isEnable ? .systemBlue : .systemGray
        
    }
    
}

