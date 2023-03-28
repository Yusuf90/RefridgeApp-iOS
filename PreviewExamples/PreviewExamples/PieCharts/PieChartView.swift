//
//  PieChartView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 20/02/2023.
//

import SwiftUI

struct PieChartView: View {
    
    private enum Constants {
        static let backgroundColor: Color = Color.white
        static let defaultSliceColor: Color = Color.black
        static let widthFraction: CGFloat = 0.75
    }
    
    let model: PieChartModel
    
    @State var activeIndex: Int
    
    private let totalText: String = "Total"
    private let totalIndex: Int = -1
    
    init(pieChartModel: PieChartModel){
        self.activeIndex = totalIndex
        self.model = pieChartModel
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack{

                ForEach(Array(model.sliceAngles.enumerated()), id: \.offset) { (index, dataPoint) in
                    PieSlice(
                        pieSliceModel: dataPoint,
                        sliceColor: model.data.first(where: { $0.id == dataPoint.id })?.sliceColor ?? Color.black,
                        onAnimationCompleted: {
                            model.startNextSliceAnimationIfNeeded(currentSliceIndex: index)
                        }
                    )
                    // TODO: Change color behaviour here (when "selected")
                    // TODO: Animation should be sequential
                }
                .frame(width: Constants.widthFraction * geometry.size.width, height: Constants.widthFraction * geometry.size.width)
            } // ZStack
            .background(Constants.backgroundColor)
            .onAppear() {
                model.sliceAngles[0].shouldStartAnimation = true
            }
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        let pieSliceMockData = PieChartModel(data: [
            PieChartModel.PieSliceData(name: "Fixed Expenses", value: 1300),
            PieChartModel.PieSliceData(name: "Restaurant & Bars", value: 300, sliceColor: Color.blue),
            PieChartModel.PieSliceData(name: "Groceries", value: 450, sliceColor: Color.green)
        ])
        
        PieChartView(pieChartModel: pieSliceMockData)
        // Add selector view here
    }
}
