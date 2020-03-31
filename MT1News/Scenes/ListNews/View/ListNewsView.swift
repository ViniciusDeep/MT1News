//
//  ListNews.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 19/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxCocoa
import RxSwift

class ListNewsView: UIViewController {
    
    private let contentView = ListNewsContentView()
    
    let listArticleViewModel = ArticleListViewModel(newsRepository: NewsRepository())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindUI()
    }
    
    fileprivate func setupView() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.title = L10n.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.cBuild(make: .fillSuperview)
    }
    
    fileprivate func bindUI() {
        listArticleViewModel.articles.bind(to: contentView.tableView.rx.items(cellIdentifier: ListNewsCell.reuseIdentifier, cellType: ListNewsCell.self)) { (row, article, cell) in
            cell.animationToRight()
            cell.setup(withArticle: article)
        }.disposed(by: disposeBag)
        
       listArticleViewModel.isLoading.bind(to: contentView.rx.isAnimating).disposed(by: disposeBag)
    }
}
