//
//  SubTabViewController.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/03/08.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

// Protcol that defines the view input methods
protocol SubTabViewInterface: class {}

class SubTabViewController: UITabBarController {

    var presenter: SubTabPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Transition Success")
        presenter.viewDidLoad()
    }
}

// MARK:- ViewInterface
extension SubTabViewController: SubTabViewInterface {}
