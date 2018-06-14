//
//  RootViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/14.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

final internal class RootViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let launchViewController: UIViewController = LaunchViewController()
        self.addChildViewController(launchViewController)
        launchViewController.view.frame = UIScreen.main.bounds
        self.view.addSubview(launchViewController.view)

        launchViewController.didMove(toParentViewController: self)
    }


    func transit(to nextViewController: UIViewController) {

        let childViewController: UIViewController = self.childViewControllers.first!
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()

        self.addChildViewController(nextViewController)
        nextViewController.view.frame = UIScreen.main.bounds
        self.view.addSubview(nextViewController.view)
        nextViewController.didMove(toParentViewController: self)
    }

    func transitAnimation(to nextViewController: UIViewController) {

        let childViewController: UIViewController = self.childViewControllers.first!
        childViewController.willMove(toParentViewController: nil)
        nextViewController.view.translatesAutoresizingMaskIntoConstraints = false

        self.addChildViewController(nextViewController)
        nextViewController.view.frame = UIScreen.main.bounds
        self.view.addSubview(nextViewController.view)

        nextViewController.view.alpha = 0
        nextViewController.view.layoutIfNeeded()

        UIView.animate(withDuration: 1.0, delay: 0.2, options: .transitionFlipFromRight, animations: {
            nextViewController.view.alpha = 1
            childViewController.view.alpha = 0
        }) { (finished) in
            childViewController.view.removeFromSuperview()
            childViewController.removeFromParentViewController()
            nextViewController.didMove(toParentViewController: self)
        }
    }
}
