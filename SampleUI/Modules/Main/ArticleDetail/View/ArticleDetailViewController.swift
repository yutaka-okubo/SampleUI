//
//  ArticleDetailViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/18.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

// Protcol that defines the view input methods
protocol ArticleDetailViewInterface: class {
    func showArticleData(article: Article)
    func showNoContentScreen()
}

class ArticleDetailViewController: UIViewController {

    var presenter: ArticleDetailPresentation!
    var article: Article!
    var indexPath: IndexPath!

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configView()
        presenter.viewDidLoad(article: article)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    private func configView() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

// MARK:- ViewInterface
extension ArticleDetailViewController: ArticleDetailViewInterface {
    func showArticleData(article: Article) {
        self.imageView.image = article.imageUrl
    }

    func showNoContentScreen() {
        print("Show table view placeholder")
    }
}
