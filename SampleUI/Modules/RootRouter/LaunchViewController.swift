//
//  LaunchViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/14.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

final internal class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let loginVC = LoginRouter.assembleModule()
        self.rootViewController(to: loginVC)
    }

    func rootViewController(to viewController: UIViewController) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController: RootViewController = appDelegate.window!.rootViewController as! RootViewController
        rootViewController.transit(to: viewController)
    }
}
