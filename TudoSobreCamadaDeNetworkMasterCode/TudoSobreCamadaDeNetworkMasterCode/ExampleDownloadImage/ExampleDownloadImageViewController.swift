//
//  ExampleDownloadImageViewController.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 18/04/26.
//

import UIKit

class ExampleDownloadImageViewController: UIViewController {
  
  private var screen = ExampleDownloadImageScreen()
  
  override func loadView() {
    view = screen
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configScreen()
  }
  
  func configScreen() {
    screen.downloadImageButton.addTarget(self, action: #selector(didTapDownloadImageButton), for: .touchUpInside)
  }
  
  @objc func didTapDownloadImageButton() {
    let text = screen.urlTextField.text ?? ""
    screen.imageView.downloadImage(urlString: text, errorImage: UIImage(systemName: "trash"), showLoadingIndicator: true)
  }
}
