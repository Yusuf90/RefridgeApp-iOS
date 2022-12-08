//
//  TabBarController.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 10/11/2022.
//

// You can create a TabBarCoordinator for deeplinks

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Private properties
    
    private enum Constants {
        static let symbolHome = "house.circle.fill"
        static let symbolStock = "refrigerator.fill"
        static let symbolRecipes = "text.book.closed.fill"
    }
    
    // MARK: - Internal properties
    
    let homeViewController = HomeViewController()
    let stockViewController = StockViewController()
    let recipesViewController = RecipesViewController()
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)

        setupViews()
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        homeViewController.setTabBarImage(imageName: Constants.symbolHome, title: "Home")
        stockViewController.setTabBarImage(imageName: Constants.symbolStock, title: "Stock")
        recipesViewController.setTabBarImage(imageName: Constants.symbolRecipes, title: "Recipes")
        
        let stockNavigationController = UINavigationController(rootViewController: stockViewController)
        let recipesNavigationController = UINavigationController(rootViewController: recipesViewController)
        
        //UITabBarController.viewControllers
        viewControllers = [homeViewController, stockNavigationController, recipesNavigationController]
    }
    
    private func setupTabBar() {
        //UITabBarController.tabBar
        tabBar.tintColor = .systemBrown
        tabBar.isTranslucent = false    }
}

private extension UIViewController {
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
