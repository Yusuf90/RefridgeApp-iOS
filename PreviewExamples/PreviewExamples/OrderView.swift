//
//  OrderView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct OrderView {
}

extension OrderView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.and.pencil")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Place order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
