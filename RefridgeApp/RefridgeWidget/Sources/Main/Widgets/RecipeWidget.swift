//
//  RecipeWidget.swift
//  RecipeWidget
//
//  Created by Syakur, Y. (Yusuf) on 17/11/2022.
//

import WidgetKit
import SwiftUI

struct RecipeWidget: Widget {
    
    // MARK: - Constants
    
    private enum Constants {
        static let kind = "RecipeWidget"
        static let displayName = "Recipe Widget"
        static let description = "Example Recipe Widget for Refridge."
    }

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: Constants.kind, provider: RecipeWidgetProvider()) { entry in
            RecipeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(Constants.displayName)
        .description(Constants.description)
        #if os(watchOS)
            .supportedFamilies([.accessoryCircular])
        #else
            .supportedFamilies([.accessoryCircular, .systemSmall])
        #endif
    }
}
