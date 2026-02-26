//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Gabriel Mors Pulga on 25/02/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.textFieldDelegate(delegate: self)
        screen?.emailTextField.delegate = self
        screen?.passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        if email.isEmpty { return false }
        
//        Regex é uma expressão que define uma padrão. [texto]@[texto].[texto]
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
//        O texto precisa bater exatamente com o padrão (Regex)
        return predicate.evaluate(with: email)
//        se bater com o padrão -> true
//        se não bater -> false
    }
    
    private func isFormValid() -> Bool {
        
        guard
            let email = screen?.emailTextField.text,
            isValidEmail(email),
            let password = screen?.passwordTextField.text,
            !password.isEmpty
        else {
            return false
        }
        
        return true
    }
    
    private func validate(_ textFied: UITextField) {
        textFied.layer.borderWidth = 2
        
        if textFied == screen?.emailTextField {
            if let email = textFied.text, isValidEmail(email) {
                textFied.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                textFied.layer.borderColor = UIColor.systemRed.cgColor
            }
            
        } else if textFied == screen?.passwordTextField {
            if let password = textFied.text, !password.isEmpty {
                textFied.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                textFied.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    //    Esse método é disparado quando o teclado sobe
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    //    Esse método é disparado quando o teclado abaixo/some
    //    O DidEnd SEMPRE é utilizado para realizar validações!!!!!!!!!!!
    func textFieldDidEndEditing(_ textField: UITextField) {
        validate(textField)
        screen?.registerButton.isEnabled = isFormValid()
    }
    
    //    Esse método é disparado quando o usuário clica no botão return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
    
    //    Esse método é disparado assim que é feito qualquer alteração de texto no textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
            let newText = text.replacingCharacters(in: range, with: string)
            print(newText)
        }
        return true
    }
}

extension LoginViewController: LoginScreenDelegate {
    func didTapLoginButton() {
        screen?.registerButton.isEnabled = isFormValid()
    }
}
