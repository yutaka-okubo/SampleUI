//
//  SerchArticle.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/15.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

struct Carousel {
    var name: String = ""
    var articles: [Article] = []

    func dummyData() -> [Carousel] {
        var articles: [Article] = []
        (1...5).forEach { (i) in
            let article = Article(id: i,
                                  name: "物件\(i)",
                                    imageUrl: #imageLiteral(resourceName: "Article1"),
                                    station: "JR恵比寿駅",
                                    buildYear: 10,
                                    price: 20000000)
            articles.append(article)
        }
        return [Carousel(name: "ピックアップ物件",
                         articles: articles),
                Carousel(name: "おすすめ物件",
                         articles: articles),
                Carousel(name: "新着物件",
                         articles: articles)]
    }
}

struct Article {
    let id: Int
    let name: String
    let imageUrl: UIImage
    let station: String
    let buildYear: Int
    let price: Int
}
