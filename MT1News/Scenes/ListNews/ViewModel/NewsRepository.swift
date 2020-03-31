//
//  ArticleService.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxSwift

protocol CreatableNewRepository {
    func getArticles() -> Observable<ArticleList>
}

struct NewsRepository: CreatableNewRepository {
    func getArticles() -> Observable<ArticleList> {
       let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=389c77dcb89a4ab79050826b32eaab7a")
       return Service<ArticleList>().get(url: url!)
    }
}
