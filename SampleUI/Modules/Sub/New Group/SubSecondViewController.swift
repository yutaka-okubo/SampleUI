//
//  SubSecondViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/14.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubSecondViewController: UIViewController {

    @IBOutlet weak var changeModeOutlet: UIButton!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeModeOutlet.rx.tap.subscribe({ _ in

            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let rootViewController: RootViewController = appDelegate.window!.rootViewController as! RootViewController
            let vc = MainTabRouter.assembleModule()
            rootViewController.transitAnimation(to: vc)
        }).disposed(by: disposeBag)
    }
}
