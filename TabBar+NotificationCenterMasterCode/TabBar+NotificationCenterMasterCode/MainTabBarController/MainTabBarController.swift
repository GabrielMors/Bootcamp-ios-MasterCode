//
//  MainTabBarController.swift
//  TabBar+NotificationCenterMasterCode
//
//  Created by Caio Fabrini on 12/03/26.
//

import UIKit

class MainTabBarController: UITabBarController {
  override func viewDidLoad() {
    let tela01 = createNavController(viewController: Tela01ViewController(), title: "Tela 01", imageName: "magnifyingglass")
    let tela02 = createNavController(viewController: Tela02ViewController(), title: "Tela 02", imageName: "heart")
    let tela03 = createNavController(viewController: Tela03ViewController(), title: "Tela 03", imageName: "star")

    viewControllers = [tela01, tela02, tela03]
    customizeTabBarAppearance()
  }

  func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(systemName: imageName)
    return navController
  }

  func customizeTabBarAppearance() {
    tabBar.tintColor = .black // cor dos itens fica black quando selecionado
    tabBar.unselectedItemTintColor = .lightGray // cor dos itens fica lightGray quando não selecionado
    tabBar.backgroundColor = .white // cor de fundo
    tabBar.isTranslucent = false // serve para não deixar transparente o fundo quando trabalhamos com lista
    tabBar.layer.borderColor = UIColor.lightGray.cgColor // cor da borda
    tabBar.layer.borderWidth = 0.5 // espessura da borda
  }
}
