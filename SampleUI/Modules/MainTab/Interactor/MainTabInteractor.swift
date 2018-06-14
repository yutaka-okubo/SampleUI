//
//  MainTabInteractor.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the Interactor's use case
protocol MainTabUsecase: class {
    var output: MainTabInteractorOutput! { get set }
    func fetchData()
}

// MARK:- Usecase
// The business logic of the module
class MainTabInteractor: MainTabUsecase {
    weak var output: MainTabInteractorOutput!
    
    func fetchData() {
        print("fetch data")
    }
}
