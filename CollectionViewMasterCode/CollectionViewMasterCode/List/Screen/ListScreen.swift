//
//  ListScreen.swift
//  CollectionViewMasterCode
//
//  Created by Caio Fabrini on 09/03/26.
//

import UIKit

class ListScreen: UIView {

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .white
    collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    return collectionView
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .orange
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
      addSubview(collectionView)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: DetailCollectionViewCell.heightCell)
    ])
  }

  func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
    collectionView.delegate = delegate
    collectionView.dataSource = dataSource
  }
}
