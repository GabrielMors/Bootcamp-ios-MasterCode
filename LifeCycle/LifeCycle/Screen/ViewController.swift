//
//  ViewController.swift
//  LifeCycle
//
//  Created by Gabriel Mors Pulga on 09/02/26.
//

import UIKit

//Criou a ViewController
// ↓
//loadView
// ↓
//viewDidLoad
// ↓
//viewWillAppear
// ↓
//viewDidAppear

//Saiu da tela:
//viewWillDisappear
// ↓
//viewDidDisappear
// ↓
//deinit (se desalocar)




class ViewController: UIViewController {

//    init() {} É o momento em que a ViewController esta sendo instanciada na memória
    
    
    override func loadView() {
        super.loadView()
        print(#function)
//        Responsável por criar a view principal
//        Normalmente nao usamos. Somente se for criar view na mão (viewCode raiz)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
//        É chamado apenas UMA VEZ no ciclo de vida da ViewController
//        setup inicial
//        Configurar UI
//        Registrar células
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        print(#function)
//        Chamado toda vez que a tela VAI APARECER
//        Atualiza dados
//        Animação / Timer
//        esconder/mostrar navigation bar
    }
    
//    Primeiro calcula o layout -> Tamanho/posição
//    Depois mostra na tela -> Usuario visualizou
    override func viewDidLayoutSubviews() {
//        Depois que o layout foi calculado.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
//        Chamado quando a tela ja está visível
//        iniar animações/ video
//        mostrar popup
    }
    
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        let controller = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
//    SAIU DA TELA
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
//        Antes de sumir a tela
//        pausa time/ animação
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
//        Depois que a tela ja sumiu.
//        limpeza pesada
//        cancelar requests
    }
    
    deinit {
        print("ViewController saiu da memória")
    }
}


