//
//  ArticleListViewModel.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxSwift

struct ArticleListViewModel {
    
    let articleService: CreatableArticleService
    
    let articles = PublishSubject<[Article]>()
        
    let articleListSubject = PublishSubject<ArticleList>()
    
    public func loadArticles() {
        _ = articleService.getArticles().subscribe(onNext: {articleList in
            self.articles.onNext(articleList.articles)
        })
    }
}
