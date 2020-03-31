//
//  ArticleListViewModel.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxSwift

struct ArticleListViewModel {
    
    let newsRepository: CreatableNewRepository
    
    let articles = PublishSubject<[Article]>()
        
    let isLoading = BehaviorSubject<Bool>(value: true)
    
    
    init(newsRepository: CreatableNewRepository) {
        self.newsRepository = newsRepository
        self.loadArticles()
    }
    
    
    public func loadArticles() {
        _ = newsRepository.getArticles().subscribe(onNext: {articleList in
            self.articles.onNext(articleList.articles)
            self.isLoading.onNext(false)
        })
    }
}
