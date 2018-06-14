//
//  UIViewController+Storyboard.swift
//  SmartQiita
//
//  Created by 長谷川将司 on 2018/06/10.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

public protocol StoryBoardInstantiatable {}
extension UIViewController: StoryBoardInstantiatable {}

public extension StoryBoardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return (storyboard.instantiateViewController(withIdentifier: self.className) as? Self)!
    }
}

