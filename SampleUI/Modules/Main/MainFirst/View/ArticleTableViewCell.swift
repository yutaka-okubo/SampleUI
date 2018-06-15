//
//  ArticleTableViewCell.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/15.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static var indentifier: String { return String(describing: self) }
    private var articles: [Article] = []
    
    @IBOutlet private weak var cellNameOutlet: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
    }

    func updateData(carousel: Carousel) {
        self.cellNameOutlet.text = carousel.name
        self.articles = carousel.articles
    }
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}

// MARK:- UICollectionViewDataSource
// MARK:- UICollectionViewDelegate
// MARK:- UICollectionViewDelegateFlowLayout
extension ArticleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCollectionViewCell.indentifier, for: indexPath) as? ArticleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let article = articles[indexPath.row]
        cell.updateData(article: article)
       return cell
    }
    
    
}
