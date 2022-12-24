//
//  StockCoordinator.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 24/12/2022.
//

import Foundation
import UIKit

final class StockCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let stockViewController = StockViewController()
    
    // MARK: - Internal methods
    
    func start() -> UIViewController {
        return stockViewController
    }
}
