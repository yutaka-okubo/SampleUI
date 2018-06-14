//
//  SubTabInteractor.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the Interactor's use case
protocol SubTabUsecase: class {
    var output: SubTabInteractorOutput! { get set }
    func fetchData()
}

// MARK:- Usecase
// The business logic of the module
class SubTabInteractor: SubTabUsecase {
    weak var output: SubTabInteractorOutput!
    
    func fetchData() {
        print("fetch data")
    }
}
