//
//  ArticleDetailInteractor.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/18.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the Interactor's use case
protocol ArticleDetailUsecase: class {
    var output: ArticleDetailInteractorOutput! { get set }
    func fetchData()
}

// MARK:- Usecase
// The business logic of the module
class ArticleDetailInteractor: ArticleDetailUsecase {
    weak var output: ArticleDetailInteractorOutput!

    func fetchData() {
        print("fetch data")
    }
}
