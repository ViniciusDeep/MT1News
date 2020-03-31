//
//  Article.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let urlToImage: String
}

struct Source: Decodable {
    let name: String
}
