//
//  ArticleService.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxSwift

protocol CreatableNewRepository {
    func getArticles(for routerRequest: ArticleRouteRequest) -> Observable<ArticleList>
}

struct NewsRepository: CreatableNewRepository {
    func getArticles(for routerRequest: ArticleRouteRequest) -> Observable<ArticleList> {
        let url = URL(string: routerRequest.endPoint)
       return Service<ArticleList>().get(url: url!)
    }
}

enum ArticleRouteRequest {
    
    case headline(country: String)
    case search(query: String)
    
    fileprivate var baseURL: String {
        return  "http://newsapi.org/v2/"
    }
    
    fileprivate var apiToken: String {
        return "389c77dcb89a4ab79050826b32eaab7a"
    }
    
    var endPoint: String {
        switch self {
        case .headline(let country):
            return "\(baseURL)top-headlines?country=\(country)&apiKey=\(apiToken)"
        case .search(let query):
        return "\(baseURL)everything?q=\(query)&apiKey=\(apiToken)"
        }
    }
}
