//
//  ContentView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("MenuView")
        }
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
