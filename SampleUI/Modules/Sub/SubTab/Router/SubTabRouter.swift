//
//  SubRouter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol SubTabWireframe: class {
    var viewController: UITabBarController? { get set }
    init(viewController: UITabBarController?)
    static func assembleModule() -> UITabBarController
    func setTab()
}

class SubTabRouter: SubTabWireframe {
    var viewController: UITabBarController?
    required init(viewController: UITabBarController?) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UITabBarController {
        let view = SubTabViewController.instantiate()
        let interactor = SubTabInteractor()
        let router = SubTabRouter(viewController: view)
        let presenter = SubTabPresenter(view: view,
                                       interactor: interactor,
                                       router: router)
        view.presenter = presenter
        interactor.output = presenter

        let firstVc = SubFirstViewController.instantiate()
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let secondVc = SubSecondViewController.instantiate()
        secondVc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        let viewControllers = [firstVc, secondVc]
        view.viewControllers = viewControllers
        
        return view
    }
    
    func setTab() {
        let firstVc = SubFirstViewController.instantiate()
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let secondVc = SubSecondViewController.instantiate()
        secondVc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let viewControllers = [firstVc, secondVc]
        self.viewController?.viewControllers = viewControllers
    }
}
