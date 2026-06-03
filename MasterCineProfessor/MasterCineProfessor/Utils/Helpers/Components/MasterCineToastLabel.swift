//
//  MasterCineToastLabel.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 03/06/26.
//

import UIKit

class MasterCineToastLabel: UIView {
    
    private let toastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    func configureView() {
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.separator.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.masksToBounds = false
        self.alpha = 0
        
        self.addSubview(toastLabel)
        
        NSLayoutConstraint.activate([
            toastLabel.topAnchor.constraint(equalTo: self.topAnchor),
            toastLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            toastLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            toastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func showToast(message: String, completion: @escaping () -> Void) {
        toastLabel.text = "  \(message)  "
        
        self.alpha = 0
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
            self.transform = .identity
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.3) {
                self.alpha = 0
                self.transform = CGAffineTransform(translationX: 0, y: 20)
                completion()
            }
        }
    }
}
