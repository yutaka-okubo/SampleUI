//
//  RootRouter.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

protocol RootWireframe: class {
    func showRootScreen()
}

public class RootRouter: RootWireframe {
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func showRootScreen() {
        let rootVC = RootViewController()
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }
}
