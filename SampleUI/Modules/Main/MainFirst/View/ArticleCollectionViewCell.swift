//
//  ArticleCollectionViewCell.swift
//  SampleUI
//
//  Created by 長谷川将司 on 2018/06/17.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    static var indentifier: String { return String(describing: self) }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet private weak var nameOutlet: UILabel!
    @IBOutlet private weak var priceOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Init code here
    }
    
    func updateData(article: Article) {
        self.imageView.image = article.imageUrl
        self.nameOutlet.text = article.name
        self.priceOutlet.text = "\(article.price)円"
    }
}
