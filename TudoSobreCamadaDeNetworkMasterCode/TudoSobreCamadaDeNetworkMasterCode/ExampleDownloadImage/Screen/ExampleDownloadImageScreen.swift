//
//  ExampleDownloadImageScreen.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 18/04/26.
//

import UIKit

class ExampleDownloadImageScreen: UIView {
  
  lazy var urlTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Digite a URL"
    tf.borderStyle = .roundedRect
    tf.keyboardType = .emailAddress
    return tf
  }()
  
  lazy var downloadImageButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Download Image", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    return button
  }()
  
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .lightGray
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 8
    return imageView
  }()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    addElements()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addElements() {
    addSubview(urlTextField)
    addSubview(downloadImageButton)
    addSubview(imageView)
  }
  
  func configConstraints() {
    NSLayoutConstraint.activate([
      urlTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      urlTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      
      downloadImageButton.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 20),
      downloadImageButton.leadingAnchor.constraint(equalTo: urlTextField.leadingAnchor),
      downloadImageButton.trailingAnchor.constraint(equalTo: urlTextField.trailingAnchor),
      downloadImageButton.heightAnchor.constraint(equalToConstant: 48),
      
      imageView.topAnchor.constraint(equalTo: downloadImageButton.bottomAnchor, constant: 20),
      imageView.leadingAnchor.constraint(equalTo: urlTextField.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: urlTextField.trailingAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 258),
    ])
  }
}
