//
//  TabBarController.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 10/11/2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    let stockViewController = StockViewController()
    let recipesViewController = RecipesViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)

        stockViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        recipesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let stockNavigationController = UINavigationController(rootViewController: stockViewController)
        let recipesNavigationController = UINavigationController(rootViewController: recipesViewController)
        
        viewControllers = [stockNavigationController, recipesNavigationController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class StockViewController: UIViewController {
    override func viewDidLoad() {
        title = "Search"
    }
}

class RecipesViewController: UIViewController {
    override func viewDidLoad() {
        title = "Contacts"
    }
}
