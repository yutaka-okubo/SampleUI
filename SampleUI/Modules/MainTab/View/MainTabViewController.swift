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

class MainTabViewController: UIViewController {

    var presenter: MainTabPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Transition Success")
        self.configView()
        presenter.viewDidLoad()
    }
    
    private func configView() {
        self.navigationItem.title = "MainTab"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK:- ViewInterface
extension MainTabViewController: MainTabViewInterface {}
