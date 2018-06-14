//
//  MainFirstRouter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol MainFirstWireframe: class {
    var viewController: UIViewController? { get set }
    init(viewController: UIViewController?)
    static func assembleModule() -> UIViewController
    func presentDetails()
}

class MainFirstRouter: MainFirstWireframe {
    var viewController: UIViewController?
    required init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UIViewController {
        let view = MainFirstViewController.instantiate()
        let interactor = MainFirstInteractor()
        let router = MainFirstRouter(viewController: view)
        let presenter = MainFirstPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        interactor.output = presenter
        let navi = UINavigationController(rootViewController: view)
        return navi
    }
    
    func presentDetails() {
    }
}
