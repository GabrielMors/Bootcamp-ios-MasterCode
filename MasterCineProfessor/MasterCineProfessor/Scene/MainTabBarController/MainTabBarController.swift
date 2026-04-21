//
//  MainTabBarController.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    configTabBar()
    customizeTabBarAppearance()
  }

  private func customizeTabBarAppearance() {
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundEffect = nil
    appearance.backgroundColor = .white
    appearance.shadowColor = .separator

    tabBar.standardAppearance = appearance
    tabBar.scrollEdgeAppearance = appearance
    tabBar.isTranslucent = false
    tabBar.tintColor = .red
    tabBar.unselectedItemTintColor = .lightGray
  }

  private func configTabBar() {
    let home = UINavigationController(rootViewController: HomeViewController())
    let profile = UINavigationController(rootViewController: ProfileViewController())

    home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage:  UIImage(systemName: "house.fill"))
    profile.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), selectedImage:  UIImage(systemName: "person.fill"))

    viewControllers = [home, profile]
  }
}
