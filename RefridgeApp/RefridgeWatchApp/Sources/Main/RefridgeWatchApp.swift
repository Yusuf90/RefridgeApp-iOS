//
//  RefridgeApp.swift
//  Refridge Watch App
//
//  Created by Syakur, Y. (Yusuf) on 16/11/2022.
//

import SwiftUI

@main
struct RefridgeWatchApp: App {
    
    private let recipeWidgetViewModel: RecipeWidgetViewModel
    
    var body: some Scene {
        WindowGroup {
            SmallRecipeWidgetView(viewModel: recipeWidgetViewModel)
        }
    }
    
    // MARK: - Object lifecycle

    init() {
        self.recipeWidgetViewModel = RecipeWidgetViewModel()
    }
}
