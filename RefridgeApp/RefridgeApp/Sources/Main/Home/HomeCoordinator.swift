//
//  HomeCoordinator.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 24/12/2022.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let homeViewController = HomeViewController()
    
    // MARK: - Internal methods
    
    func start() -> UIViewController {
        return homeViewController
    }
}
