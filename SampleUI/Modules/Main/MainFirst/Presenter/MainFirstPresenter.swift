//
//  MainFirstPresenter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the commands sent from View to Presenter
protocol MainFirstPresentation: class {
    var view: MainFirstViewInterface? { get set }

    init(view: MainFirstViewInterface?, interactor: MainFirstUsecase, router: MainFirstWireframe)
    
    func viewDidLoad()
    func transition()
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol MainFirstInteractorOutput: class {}

// MARK:- Presentation
class MainFirstPresenter: MainFirstPresentation {
    weak var view: MainFirstViewInterface?
    private let interactor: MainFirstUsecase
    private let router: MainFirstWireframe
    
    required init(view: MainFirstViewInterface?, interactor: MainFirstUsecase, router: MainFirstWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
        view?.setStackView()
    }
    
    func transition() {
        router.presentDetails()
    }
}

// MARK:- InteractorOutput
extension MainFirstPresenter: MainFirstInteractorOutput {}
