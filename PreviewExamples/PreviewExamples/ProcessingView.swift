//
//  ProcessingView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct ProcessingView {
    let displayString: String
    @Binding var isShowingSheet: Bool
}

extension ProcessingView: View {
    var body: some View {
        Text(displayString)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    isShowingSheet = false
                }
            }
        }
        .padding(20)
    }
}

struct ProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProcessingView(displayString: "Processing Order...", isShowingSheet: .constant(true))
        }
    }
}
