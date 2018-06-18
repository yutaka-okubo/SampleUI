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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateData(carousel: Carousel) {
        self.cellNameOutlet.text = carousel.name
        self.articles = carousel.articles
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
