//
//  ListNewsCell.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 19/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import Reusable
import CBuilder
import SDWebImage

class ListNewsCell: UITableViewCell, Reusable, ConfigurableView {

    let bannerImage = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
    }
    
    let tagLabel = configure(UILabel()) {
        $0.font = UIFont(name: "Arial", size: 12)
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    let titleLabel = configure(UILabel()) {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([bannerImage, tagLabel, titleLabel])
    }
       
    func setupConstraints() {
        bannerImage.cBuild { (make) in
            make.leading.equal(to: self.leadingAnchor, offsetBy: 0)
            make.trailing.equal(to: self.trailingAnchor, offsetBy: 0)
            make.top.equal(to: self.topAnchor, offsetBy: 10)
            make.bottom.equal(to: self.bottomAnchor, offsetBy: -90)
        }
        
        tagLabel.cBuild { (make) in
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.top.equal(to: bannerImage.bottomAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
        }
        
        titleLabel.cBuild { (make) in
            make.leading.equal(to: tagLabel.leadingAnchor, offsetBy: 0)
            make.trailing.equal(to: self.trailingAnchor, offsetBy: -5)
            make.top.equal(to: tagLabel.bottomAnchor, offsetBy: 5)

        }
    }
    
    public func setup(withArticle article: Article) {
        titleLabel.text = article.title
        tagLabel.text = article.source.name
        guard let urlImage = URL(string: article.urlToImage) else {return}
        bannerImage.sd_setImage(with: urlImage)
    }
}
