//
//  PieChartModel.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 18/03/2023.
//

import Foundation
import SwiftUI

final class PieChartModel {
    
    // MARK: - Internal properties
    
    struct PieSliceData: Identifiable {
        var name: String
        var value: Double
        var sliceColor: Color?
        var id = UUID()
    }
    
    var data: [PieSliceData]
    lazy var sliceAngles: [PieSliceModel] = {
        let sum = data.map{$0.value}.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceModel] = []
        
        for (_, value) in data.enumerated() {
            let degrees: Double = value.value * 360 / sum
            let sliceModel = PieSliceModel(startAngle: Angle(degrees: endDeg),
                                           endAngle: Angle(degrees: endDeg + degrees),
                                           id: value.id)
            
            tempSlices.append(sliceModel)
            endDeg += degrees
        }
        
        return tempSlices
    }()
    
    // MARK: - Init
    
    init(data: [PieChartModel.PieSliceData]) {
        self.data = data
    }
    
    func startNextSliceAnimationIfNeeded(currentSliceIndex: Int) {
        let nextSliceIndex = currentSliceIndex + 1
        guard nextSliceIndex < sliceAngles.count else { return }
        
        sliceAngles[nextSliceIndex].shouldStartAnimation = true
    }
}

class PieSliceModel: Identifiable, ObservableObject {
    let startAngle: Angle
    let endAngle: Angle
    var id = UUID()
    @Published var shouldStartAnimation = false
    
    init(startAngle: Angle, endAngle: Angle, id: UUID = UUID(), shouldStartAnimation: Bool = false) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.id = id
        self.shouldStartAnimation = shouldStartAnimation
    }
}
