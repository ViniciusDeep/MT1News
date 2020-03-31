//
//  AppCoordinator.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 19/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

struct AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showListNews()
    }
    
    func showListNews() {
        window.rootViewController = UINavigationController(rootViewController: ListNewsView())
        window.makeKeyAndVisible()
    }
}


