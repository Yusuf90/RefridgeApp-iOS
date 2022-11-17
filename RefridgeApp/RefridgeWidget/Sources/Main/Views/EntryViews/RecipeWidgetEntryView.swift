//
//  RecipeWidgetEntryView.swift
//  RefridgeWidgetExtension
//
//  Created by Syakur, Y. (Yusuf) on 17/11/2022.
//

import WidgetKit
import SwiftUI

/// A view used for visualising a SimpleEntry
struct RecipeWidgetEntryView: View {

    // MARK: - Private properties

    private let entry: RecipeEntry

    // MARK: - Body

    var body: some View {
        Text(entry.date, style: .time)
    }

    // MARK: - Object lifecycle

    init(entry: RecipeEntry) {
        self.entry = entry
    }

}

struct RecipeWidget_Previews: PreviewProvider {
    static var previews: some View {
        RecipeWidgetEntryView(entry: RecipeEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
