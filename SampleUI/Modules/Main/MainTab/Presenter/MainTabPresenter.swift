//
//  MainTabPresenter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the commands sent from View to Presenter
protocol MainTabPresentation: class {
    var view: MainTabViewInterface? { get set }

    init(view: MainTabViewInterface?, interactor: MainTabUsecase, router: MainTabWireframe)
    
    func viewDidLoad()
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol MainTabInteractorOutput: class {}

// MARK:- Presentation
class MainTabPresenter: MainTabPresentation {
    weak var view: MainTabViewInterface?
    private let interactor: MainTabUsecase
    private let router: MainTabWireframe
    
    required init(view: MainTabViewInterface?, interactor: MainTabUsecase, router: MainTabWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        router.setTab()
    }
}

// MARK:- InteractorOutput
extension MainTabPresenter: MainTabInteractorOutput {}
