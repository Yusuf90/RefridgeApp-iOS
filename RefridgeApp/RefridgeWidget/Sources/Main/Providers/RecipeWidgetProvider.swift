//
//  RecipeWidgetProvider.swift
//  RefridgeWidgetExtension
//
//  Created by Syakur, Y. (Yusuf) on 17/11/2022.
//

import WidgetKit
import SwiftUI

struct RecipeWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> RecipeEntry {
        RecipeEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (RecipeEntry) -> ()) {
        let entry = RecipeEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RecipeEntry>) -> ()) {
        var entries: [RecipeEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = RecipeEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
