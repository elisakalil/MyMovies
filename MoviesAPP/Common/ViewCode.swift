//
//  ViewCode.swift
//  MazeTv
//
//  Created by Karolina Attekita on 10/02/22.
//

import Foundation

protocol ViewCode {

    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCode {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

//    func buildHierarchy() {}
//      setando a func como opcional
//    func setupConstraints() {}
//
//    func applyAdditionalChanges() {}
}
