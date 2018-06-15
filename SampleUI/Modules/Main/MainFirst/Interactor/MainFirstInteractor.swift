//
//  MainFirstInteractor.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the Interactor's use case
protocol MainFirstUsecase: class {
    var output: MainFirstInteractorOutput! { get set }
    func fetchData()
}

// MARK:- Usecase
// The business logic of the module
class MainFirstInteractor: MainFirstUsecase {
    weak var output: MainFirstInteractorOutput!
    
    func fetchData() {
        let carousels = Carousel().dummyData()
        output.carouselFetched(carousels: carousels)
    }
}
