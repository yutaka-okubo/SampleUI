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
    func refreshTable()
    func transition(article: Article, indexPath: IndexPath)
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol MainFirstInteractorOutput: class {
    func carouselFetched(carousels: [Carousel])
}

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
    }
    
    func refreshTable() {
        interactor.fetchData()
    }
    
    func transition(article: Article, indexPath: IndexPath) {
        router.presentDetails(article: article, indexPath: indexPath)
    }
}

// MARK:- InteractorOutput
extension MainFirstPresenter: MainFirstInteractorOutput {
    func carouselFetched(carousels: [Carousel]) {
        self.view?.showCarouselData(carousels: carousels)
    }
}
