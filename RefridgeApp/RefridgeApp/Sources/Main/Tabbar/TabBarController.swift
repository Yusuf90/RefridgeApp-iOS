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
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial configuration
        tabBar.barTintColor = .secondarySystemBackground
        tabBar.tintColor = .systemBrown
        tabBar.isTranslucent = false
    }
}
