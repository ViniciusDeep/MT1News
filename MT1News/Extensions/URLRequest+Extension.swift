//
//  URLRequest+Extension.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxCocoa
import RxSwift

struct Service<T: Decodable> {
    
    func get(url: URL) -> Observable<T> {
        return Observable.from([url]).flatMap { (url) -> Observable<Data> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.data(request: request)
        }.map { (data) -> T in
            return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
    
}
