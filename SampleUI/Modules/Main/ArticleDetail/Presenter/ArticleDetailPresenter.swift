//
//  ArticleDetailPresenter.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/18.
//  Copyright © 2018年 marcy. All rights reserved.
//

import Foundation

// Protcol that defines the commands sent from View to Presenter
protocol ArticleDetailPresentation: class {
    var view: ArticleDetailViewInterface? { get set }

    init(view: ArticleDetailViewInterface?, interactor: ArticleDetailUsecase, router: ArticleDetailWireframe)

    func viewDidLoad(article: Article)
}

// Protcol that defines the commands sent from Interactor to Presenter
protocol ArticleDetailInteractorOutput: class {}

// MARK:- Presentation
class ArticleDetailPresenter: ArticleDetailPresentation {
    weak var view: ArticleDetailViewInterface?
    private let interactor: ArticleDetailUsecase
    private let router: ArticleDetailWireframe

    private var article: Article? {
        didSet {
            guard let article = article else {
                return (view?.showNoContentScreen())!
            }
            view?.showArticleData(article: article)

        }
    }

    required init(view: ArticleDetailViewInterface?, interactor: ArticleDetailUsecase, router: ArticleDetailWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad(article: Article) {
        self.article = article
    }
}

// MARK:- InteractorOutput
extension ArticleDetailPresenter: ArticleDetailInteractorOutput {}

