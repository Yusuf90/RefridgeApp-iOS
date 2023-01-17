//
//  ContentView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 13/01/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MenuView()
            }
            .tabItem {
                    Label("Menu", systemImage: "list.dash")
            }

            NavigationStack {
                OrderView()
            }
            .tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
