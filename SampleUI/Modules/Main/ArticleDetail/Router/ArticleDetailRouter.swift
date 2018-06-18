//
//  ArticleDetailRouter.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/18.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol ArticleDetailWireframe: class {
    var viewController: ArticleDetailViewController? { get set }
    init(viewController: ArticleDetailViewController?)
    static func assembleModule(article: Article) -> ArticleDetailViewController
}

class ArticleDetailRouter: ArticleDetailWireframe {
    var viewController: ArticleDetailViewController?
    required init(viewController: ArticleDetailViewController?) {
        self.viewController = viewController
    }

    static func assembleModule(article: Article) -> ArticleDetailViewController {
        let view = ArticleDetailViewController.instantiate()
        let interactor = ArticleDetailInteractor()
        let router = ArticleDetailRouter(viewController: view)
        let presenter = ArticleDetailPresenter(view: view,
                                         interactor: interactor,
                                         router: router)
        view.presenter = presenter
        view.article = article
        interactor.output = presenter

        return view
    }

}
