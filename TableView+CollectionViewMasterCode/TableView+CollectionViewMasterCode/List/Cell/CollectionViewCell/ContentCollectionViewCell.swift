//
//  ContentCollectionViewCell.swift
//  TableView+CollectionViewMasterCode
//
//  Created by Caio Fabrini on 11/03/26.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
  
  static let identifier: String = String(describing: ContentCollectionViewCell.self)
  static let heightCell: CGFloat = 80
  static let labelFont = UIFont.boldSystemFont(ofSize: 16)
  
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = ContentCollectionViewCell.labelFont
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addElements()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addElements() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
  }
  
  func configConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      imageView.widthAnchor.constraint(equalToConstant: 24),
      imageView.heightAnchor.constraint(equalToConstant: 24),
      
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func setupCell(item: Item) {
    imageView.image = UIImage(systemName: item.imageName)
    titleLabel.text = item.title
  }
  
  static func calculateSize(title: String) -> CGSize {
    let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: heightCell)
    let boundingBox = (title as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: labelFont], context: nil)
    let widthLayer: CGFloat = 20 // esse valor é a soma das distancias das constraints laterais do elemento + 4 de gordura (8 + 8 == 16 + 4 de gordura)
    return CGSize(width: boundingBox.width + widthLayer, height: heightCell)
  }
}
