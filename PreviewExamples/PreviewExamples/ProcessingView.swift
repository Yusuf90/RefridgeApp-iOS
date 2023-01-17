//
//  ProcessingView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct ProcessingView {
    
}

extension ProcessingView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Processing Order...")
            Button("Cancel") {
            }
        }
        .padding(20)
    }
}

struct ProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingView()
    }
}
