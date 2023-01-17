//
//  OrderView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct OrderView {
    @State var isShowingSheet: Bool = false
}

extension OrderView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.and.pencil")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Place order")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingSheet = true
                }
                label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationStack {
                ProcessingView(displayString: "Processing Order...", isShowingSheet: $isShowingSheet)
            }
        }
        .navigationTitle("Place your order")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderView()
        }
    }
}
