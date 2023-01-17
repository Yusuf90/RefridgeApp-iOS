//
//  BasicSwiftUIView.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    var name: String
    var body: some View {
        Text("Hello, \(name)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(name: "World")
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            ContentView(name: "SwiftUI")
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 8 (45mm)"))
        }
    }
}
