//
//  ViewCode.swift
//  MoviesAPP
//
//  Created by rai on 07/10/23.
//  Copyright © 2023 Railson Dev. All rights reserved.
//

protocol ViewCode{
    func buildHierarchy()
    func setupContraints()
    func applyAdditionalChanges()
}


extension ViewCode{
    func setupView(){
        buildHierarchy()
        setupContraints()
        applyAdditionalChanges()
    }
}
