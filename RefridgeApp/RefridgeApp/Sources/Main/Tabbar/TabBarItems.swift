//
//  TabBarItems.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 21/12/2022.
//

import Foundation
import UIKit

protocol TabBarItem {
    var title: String { get }
    var imageName: String { get }
    var coordinator: Coordinator { get }
    
    func setup() -> UIViewController
}

extension TabBarItem {
    func setup() -> UIViewController {
        let startViewController = coordinator.start()
        startViewController.tabBarItem = UITabBarItem(title: title, image: setTabBarImage(imageName: imageName), tag: 0)
        return startViewController
    }
    
    func setTabBarImage(imageName: String) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        guard let tabBarImage = UIImage(systemName: imageName, withConfiguration: configuration) else {
            fatalError("TabBar image named \(imageName) could not be found in system UIImage")
        }
        return tabBarImage
    }
}

// MARK: - Specific items

struct HomeTabBarItem: TabBarItem {
    let title: String = "Home"
    let imageName: String = "house.circle.fill"
    var coordinator: Coordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}

struct StockTabBarItem: TabBarItem {
    let title: String = "Stock"
    let imageName: String = "refrigerator.fill"
    var coordinator: Coordinator
    
    init(coordinator: StockCoordinator) {
        self.coordinator = coordinator
    }
}

struct RecipesTabBarItem: TabBarItem {
    let title: String = "Recipes"
    let imageName: String = "text.book.closed.fill"
    var coordinator: Coordinator
    
    init(coordinator: RecipesCoordinator) {
        self.coordinator = coordinator
    }
}
