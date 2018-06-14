//
//  MainTabViewController.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/03/08.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

// Protcol that defines the view input methods
protocol MainTabViewInterface: class {}

class MainTabViewController: UITabBarController {

    var presenter: MainTabPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Transition Success")
        presenter.viewDidLoad()
    }
}

// MARK:- ViewInterface
extension MainTabViewController: MainTabViewInterface {}
