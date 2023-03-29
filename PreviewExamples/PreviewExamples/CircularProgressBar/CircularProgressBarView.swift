//
//  CircularProgressBarView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 29/03/2023.
//

import SwiftUI

struct CircularProgressBarView: View {
    
    @State var progressAnimation: Double = 0.0
    let barPercentage: Double
    
    private enum Constants {
        static let barColor = Color.gray
        static let fillColor = Color.blue
        static let barWidth: CGFloat = 8
        static let figureHeight: CGFloat = 200
        static let figureWidth: CGFloat = 200
        static let animationDuration: CGFloat = 1.0
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Constants.barColor,
                    lineWidth: Constants.barWidth
                )
            Circle()
                .trim(from: 0, to: progressAnimation)
                .stroke(
                    Constants.fillColor,
                    lineWidth: Constants.barWidth
                )
                .rotationEffect(.degrees(-90))
                .onAppear {
                    withAnimation(.easeInOut(duration: Constants.animationDuration)) {
                        self.progressAnimation = self.barPercentage
                    }
                }
            VStack {
                Image(systemName: "house")
                Text("Test")
                Text("-1.143,00")
            } // VStack
        } // ZStack
        .frame(width: Constants.figureWidth, height: Constants.figureHeight)
    }
}

struct CircularProgressBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            CircularProgressBarView(barPercentage: 0.25)
        }
    }
}
