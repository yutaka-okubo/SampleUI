//
//  LoginInteractor.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the Interactor's use case
protocol LoginUsecase: class {
    var output: LoginInteractorOutput! { get set }
    func fetchData()
}

// MARK:- Usecase
// The business logic of the module
class LoginInteractor: LoginUsecase {
    weak var output: LoginInteractorOutput!
    
    func fetchData() {
        print("fetch data")
    }
}
