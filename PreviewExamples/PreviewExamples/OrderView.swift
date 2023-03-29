//
//  OrderView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct OrderView {
    @State var isShowingSheet: Bool = false
    @State var progress: Double = 0
}

extension OrderView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                // 2
                CircularProgressBarView(barPercentage: progress)
                // 3
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }.frame(width: 200, height: 200)
            Spacer()
            HStack {
                // 4
                Slider(value: $progress, in: 0...1)
                // 5
                Button("Reset") {
                    resetProgress()
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    
    func resetProgress() {
        progress = 0
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderView()
        }
    }
}
