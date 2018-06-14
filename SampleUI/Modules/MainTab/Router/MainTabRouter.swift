//
//  MainRouter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol MainTabWireframe: class {
    var viewController: UIViewController? { get set }
    init(viewController: UIViewController?)
    static func assembleModule() -> UIViewController
    func presentDetails()
}

class MainTabRouter: MainTabWireframe {
    var viewController: UIViewController?
    required init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UIViewController {
        let view = MainTabViewController.instantiate()
        let interactor = MainTabInteractor()
        let router = MainTabRouter(viewController: view)
        let presenter = MainTabPresenter(view: view,
                                       interactor: interactor,
                                       router: router)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
    
    func presentDetails() {
        // TODO:- Show detail screen
    }
}
