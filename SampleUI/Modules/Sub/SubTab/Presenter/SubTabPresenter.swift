//
//  SubTabPresenter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the commands sent from View to Presenter
protocol SubTabPresentation: class {
    var view: SubTabViewInterface? { get set }

    init(view: SubTabViewInterface?, interactor: SubTabUsecase, router: SubTabWireframe)
    
    func viewDidLoad()
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol SubTabInteractorOutput: class {}

// MARK:- Presentation
class SubTabPresenter: SubTabPresentation {
    weak var view: SubTabViewInterface?
    private let interactor: SubTabUsecase
    private let router: SubTabWireframe
    
    required init(view: SubTabViewInterface?, interactor: SubTabUsecase, router: SubTabWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        router.setTab()
    }
}

// MARK:- InteractorOutput
extension SubTabPresenter: SubTabInteractorOutput {}
