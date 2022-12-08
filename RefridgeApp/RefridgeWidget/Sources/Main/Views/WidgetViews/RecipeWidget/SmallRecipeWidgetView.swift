//
//  SmallRecipeWidgetView.swift
//  RefridgeWidgetExtension
//
//  Created by Syakur, Y. (Yusuf) on 23/11/2022.
//

import WidgetKit
import SwiftUI

struct SmallRecipeWidgetView: View {

    // MARK: - Private properties

    @State private var recipeGoal = 0.8

    private let viewModel: RecipeWidgetViewModel

    // MARK: - Body

    var body: some View {
        VStack (alignment: .center) {
            Image(systemName: "cup.and.saucer.fill")
                .foregroundColor(.orange)
        }
    }

    // MARK: - Object lifecycle

    init(viewModel: RecipeWidgetViewModel) {
        self.viewModel = viewModel
    }
}
