//
//  TabBarCoordinator.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 01/12/2022.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let tabBarItems: [TabBarItem]
    
    private let homeCoordinator: HomeCoordinator?
    private let stockCoordinator: StockCoordinator?
    private let recipesCoordinator: RecipesCoordinator?
    
    private let tabBarController = TabBarController()
    
    // MARK: - Object lifecycle
    
    init(
        homeCoordinator: HomeCoordinator?,
        stockCoordinator: StockCoordinator?,
        recipesCoordinator: RecipesCoordinator?
    ) {
        self.homeCoordinator = homeCoordinator
        self.stockCoordinator = stockCoordinator
        self.recipesCoordinator = recipesCoordinator
        self.tabBarItems = [TabBarItem?](arrayLiteral:
                                            homeCoordinator.map(HomeTabBarItem.init),
                                         stockCoordinator.map(StockTabBarItem.init),
                                         recipesCoordinator.map(RecipesTabBarItem.init)
        ).compactMap { $0 }
    }
    
    // MARK: - Internal methods
    
    func start() -> UIViewController {
        setupTabBarItems()
        return tabBarController
    }
    
    // MARK: - Private methods
    
    private func setupTabBarItems() {
        tabBarController.tabBar.tintColor = UIColor.systemBackground
        tabBarController.viewControllers = self.tabBarItems.map { $0.setup() }
    }
    
    private func openHome() {
        guard let index = self.tabBarItems.firstIndex(where: { $0 is HomeTabBarItem}) else { return }
        tabBarController.selectedIndex = index
    }
    
    private func openStock() {
        guard let index = self.tabBarItems.firstIndex(where: { $0 is StockTabBarItem}) else { return }
        tabBarController.selectedIndex = index
    }
    
    private func openRecipes() {
        guard let index = self.tabBarItems.firstIndex(where: { $0 is RecipesTabBarItem}) else { return }
        tabBarController.selectedIndex = index
    }
}
