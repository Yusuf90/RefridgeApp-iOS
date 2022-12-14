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
        // Fallback on earlier versions (make normal ProgressBar)
        VStack(alignment: .leading) {
            Image(systemName: "cup.and.saucer.fill")
                .foregroundColor(.accentColor)
                .scaleEffect(1.5)
                .padding(8)
            Text("Title placeholder")
                .font(.headline)
                .foregroundColor(.accentColor)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(.accentColor)
                    Rectangle().frame(width: min(CGFloat(recipeGoal)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(.primary)
                        .animation(.linear)
                } // ZStack
                .cornerRadius(45.0)
            }.frame(height: 10)
        } // VStack
        .padding(16)
        .widgetURL(nil)
    }

    // MARK: - Object lifecycle

    init(viewModel: RecipeWidgetViewModel) {
        self.viewModel = viewModel
    }
}
