//
//  LoginPresenter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the commands sent from View to Presenter
protocol LoginPresentation: class {
    var view: LoginViewInterface? { get set }

    init(view: LoginViewInterface?, interactor: LoginUsecase, router: LoginWireframe)
    
    func viewDidLoad()
    func transition()
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol LoginInteractorOutput: class {}

// MARK:- Presentation
class LoginPresenter: LoginPresentation {
    weak var view: LoginViewInterface?
    private let interactor: LoginUsecase
    private let router: LoginWireframe
    
    required init(view: LoginViewInterface?, interactor: LoginUsecase, router: LoginWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    func transition() {
        router.presentDetails()
    }
}

// MARK:- InteractorOutput
extension LoginPresenter: LoginInteractorOutput {}
