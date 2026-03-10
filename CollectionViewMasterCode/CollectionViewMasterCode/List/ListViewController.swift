//
//  ListViewController.swift
//  CollectionViewMasterCode
//
//  Created by Caio Fabrini on 09/03/26.
//

import UIKit

class ListViewController: UIViewController {
  var screen: ListScreen = ListScreen()

  var list = [Detail(text: "Olá mundo", image: "house"),
              Detail(text: "Preciso de ferias", image: "house"),
              Detail(text: "Bora estudar?", image: "house"),
              Detail(text: "Esse trabalho ta me matando", image: "house"),
              Detail(text: "Copa do mundo 2026", image: "house"),

  ]

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
  }

  func configProtocols() {
    screen.configCollectionViewProtocols(delegate: self, dataSource: self)
  }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell
    cell?.setupCell(detail: list[indexPath.row])
    return cell ?? UICollectionViewCell()
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return DetailCollectionViewCell.calculateSize(title: list[indexPath.row].text)
  }
}

