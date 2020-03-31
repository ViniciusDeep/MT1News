//
//  ListNews.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 19/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxCocoa
import RxSwift

class ListNewsView: UITableViewController {
    
    let listArticleViewModel = ArticleListViewModel(articleService: ArticleService())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        setupView()
        setupTableView()
        listArticleViewModel.loadArticles()
        bindUI()
    }
    
    fileprivate func setupView() {
        navigationItem.title = "MT1News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = .tableViewBackgroundColor
        tableView.register(cellType: ListNewsCell.self)
        tableView.rowHeight = 250
        tableView.separatorStyle = .none
    }
    
    fileprivate func bindUI() {
        listArticleViewModel.articles.bind(to: tableView.rx.items(cellIdentifier: ListNewsCell.reuseIdentifier, cellType: ListNewsCell.self)) { (row, article, cell) in
            cell.setup(withArticle: article)
        }.disposed(by: disposeBag)
    }
}


