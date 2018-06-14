//
//  MainFirstViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/14.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

// Protcol that defines the view input methods
protocol MainFirstViewInterface: class {
    func setStackView()
}

class MainFirstViewController: UIViewController {

    var presenter: MainFirstPresentation!

    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Build Success")
        self.configView()
        
        presenter.viewDidLoad()
    }

    private func configView() {
        self.navigationItem.title = "探す"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK:- ViewInterface
extension MainFirstViewController: MainFirstViewInterface {
    func setStackView() {
        let Test1View = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 250, height: 250))
        let bgColor = UIColor.blue
        Test1View.backgroundColor = bgColor
        stackView.addArrangedSubview(Test1View)
        let Test2View = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 250, height: 250))
        let rgColor = UIColor.red
        Test2View.backgroundColor = rgColor
        stackView.addArrangedSubview(Test2View)
    }
}

