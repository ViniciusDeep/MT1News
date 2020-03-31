//
//  ListNewsContentView.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import RxCocoa
import RxSwift
import SkeletonView

class ListNewsContentView: UIView, ConfigurableView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.backgroundColor = UIColor(named: .tableViewBackgroundColor)
        tableView.register(cellType: ListNewsCell.self)
        tableView.rowHeight = 300
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let activityIndicator = configure(UIActivityIndicatorView()) {
        $0.startAnimating()
        $0.style = .large
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.isSkeletonable = true
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.cBuild{
            $0.top.equal(to: topAnchor, offsetBy: 20)
            $0.leading.equal(to: leadingAnchor)
            $0.trailing.equal(to: trailingAnchor)
            $0.bottom.equal(to: bottomAnchor)
        }
    }
    
    func update(loading: Bool) {
        if loading {
            addSubviews([activityIndicator])
            activityIndicator.cBuild(make: .centerInSuperView)
        } else {
            activityIndicator.removeFromSuperview()
        }
    }
}

extension Reactive where Base: ListNewsContentView {
    
    var isAnimating: Binder<Bool> {
        return Binder(base) { (view, isAnimate) in
            view.update(loading: isAnimate)
        }
    }
}
    
    


