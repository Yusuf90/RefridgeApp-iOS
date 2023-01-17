//
//  CircularRecipeWidgetView.swift
//  RefridgeWidgetExtension
//
//  Created by Syakur, Y. (Yusuf) on 23/11/2022.
//

import WidgetKit
import SwiftUI

struct CircularRecipeWidgetView: View {

    // MARK: - Private properties

    @State private var recipeGoal = 0.8

    private let viewModel: RecipeWidgetViewModel

    // MARK: - Body

    var body: some View {
        Gauge(value: recipeGoal) {
            
        } currentValueLabel: {
            Image(systemName: "cup.and.saucer.fill")
                .foregroundColor(.accentColor)
        }
        .gaugeStyle(.accessoryCircular)
    }

    // MARK: - Object lifecycle

    init(viewModel: RecipeWidgetViewModel) {
        self.viewModel = viewModel
    }
}

struct CircularRecipeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        CircularRecipeWidgetView(viewModel: RecipeWidgetViewModel())
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
