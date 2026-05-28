//
//  ViewCode.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 27/05/26.
//

protocol ViewCode {
    func setUp()
    func setupConstraints()
    func addSubviews()
    func configureView()
}

extension ViewCode {
    func setUp() {
        addSubviews()
        configureView()
        setupConstraints()
    }
}
