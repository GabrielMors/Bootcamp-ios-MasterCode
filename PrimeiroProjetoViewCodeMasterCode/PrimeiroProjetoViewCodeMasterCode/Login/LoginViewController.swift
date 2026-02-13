//
//  LoginViewController.swift
//  PrimeiroProjetoViewCodeMasterCode
//
//  Created by Caio Fabrini on 12/02/26.
//

//MARK: - Receita de bola - Configurar Projeto
// 1 - Remover a Main
// 2 - Remover todas as referencias da main
// Acesse o Info.plist e faça um search por main, e remova
// Acessar o project (simbolo do xcode), vá para o build settings e faça um search por main e remova
// 3 - Configurar o SceneDelegate
// 4 - Teste colocando uma cor de fundo na sua VC ->  view.backgroundColor = .red

// Bonus: Crie seus code snippets!!
// Selecione a area que vc gostaria de criar o seu snippets e depois clique com o botão direito e selecione em "create code snippets"
// Como editar/visualizar TODOS seus code snippets? Pressione CMD + SHIFT + L


import UIKit

class LoginViewController: UIViewController {

  let screen: LoginScreen = LoginScreen()

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

