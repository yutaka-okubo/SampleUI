//
//  LoginViewController.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/03/08.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

// Protcol that defines the view input methods
protocol LoginViewInterface: class {
    func login()
}

class LoginViewController: UIViewController {

    @IBOutlet private weak var loginOutlet: UIButton!
    var presenter: LoginPresentation!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Build Success")
        self.configView()
        presenter.viewDidLoad()
    }
    
    private func configView() {
        self.navigationItem.title = "Login"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK:- ViewInterface
extension LoginViewController: LoginViewInterface {
    func login() {
        loginOutlet.rx.tap.subscribe({[weak self] _ in
            guard let sSelf = self else { return }
            sSelf.presenter.transition()
        }).disposed(by: disposeBag)
    }
}
