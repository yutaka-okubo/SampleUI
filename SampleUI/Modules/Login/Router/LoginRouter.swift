//
//  LoginRouter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol LoginWireframe: class {
    var viewController: UIViewController? { get set }
    init(viewController: UIViewController?)
    static func assembleModule() -> UIViewController
    func presentDetails()
}

class LoginRouter: LoginWireframe {
    var viewController: UIViewController?
    required init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UIViewController {
        let view = LoginViewController.instantiate()
        let interactor = LoginInteractor()
        let router = LoginRouter(viewController: view)
        let presenter = LoginPresenter(view: view,
                                       interactor: interactor,
                                       router: router)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
    
    func presentDetails() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController: RootViewController = appDelegate.window!.rootViewController as! RootViewController
        let vc = MainTabRouter.assembleModule()
        rootViewController.transit(to: vc)
    }
}
