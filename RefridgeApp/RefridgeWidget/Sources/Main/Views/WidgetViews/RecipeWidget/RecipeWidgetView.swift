//
//  RecipeWidgetView.swift
//  RefridgeWidgetExtension
//
//  Created by Syakur, Y. (Yusuf) on 17/11/2022.
//

import SwiftUI
import WidgetKit

/// A view responsible for displaying a recipe widget for all widget families
struct RecipeWidgetView: View {
    
    // MARK: - Private properties
    
    @Environment(\.widgetFamily) private var family
    private let recipeWidgetViewModel: RecipeWidgetViewModel
    
    // MARK: - Body
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallRecipeWidgetView(viewModel: recipeWidgetViewModel)
        case .accessoryCircular:
            CircularRecipeWidgetView(viewModel: recipeWidgetViewModel)
        default:
            EmptyView()
        }
    }
    
    // MARK: - Object lifecycle
    
    init(viewModel: RecipeWidgetViewModel) {
        self.recipeWidgetViewModel = viewModel
    }
    
}

struct RecipeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircularRecipeWidgetView(viewModel: RecipeWidgetViewModel())
                .previewContext(WidgetPreviewContext(family: .accessoryCircular))
            //SmallRecipeWidgetView(viewModel: RecipeWidgetViewModel())
            //    .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
