//
//  RecipesCoordinator.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 22/12/2022.
//

import Foundation
import UIKit

final class RecipesCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let recipeViewController = RecipesViewController()
    
    // MARK: - Internal methods
    
    func start() -> UIViewController {
        return recipeViewController
    }
}
