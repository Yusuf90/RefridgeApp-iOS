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
        if #available(iOSApplicationExtension 16.0, *) {
            Gauge(value: recipeGoal) {
                
            } currentValueLabel: {
                Image(systemName: "cup.and.saucer.fill")
                    .foregroundColor(.accentColor)
            }
            .gaugeStyle(.accessoryCircular)
        }
    }

    // MARK: - Object lifecycle

    init(viewModel: RecipeWidgetViewModel) {
        self.viewModel = viewModel
    }
}
