//
//  PieChartModel.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 18/03/2023.
//

import Foundation
import SwiftUI

final class PieChartModel: ObservableObject {
    
    // MARK: - Internal properties
    
    struct PieSliceData: Identifiable {
        var name: String
        var value: Double
        var sliceColor: Color?
        var id = UUID()
    }
    
    @Published var data: [PieSliceData]
    var sliceAngles: [PieSliceModel] {
        let sum = data.map{$0.value}.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceModel] = []
        
        for (_, value) in data.enumerated() {
            let degrees: Double = value.value * 360 / sum
            tempSlices.append(PieSliceModel(startAngle: Angle(degrees: endDeg),
                                            endAngle: Angle(degrees: endDeg + degrees),
                                            id: value.id))
            endDeg += degrees
        }
        return tempSlices
    }
    
    // MARK: - Init
    
    init(data: [PieChartModel.PieSliceData]) {
        self.data = data
    }
}
