//
//  ListNews.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 19/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListNewsView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupTableView()
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
}

extension ListNewsView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ListNewsCell.self)
        return cell
    }
}
