//
//  PieChartModel.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 18/03/2023.
//

import Foundation
import SwiftUI

final class PieChartModel: ObservableObject {
    
    struct PieSliceData: Identifiable {
        var name: String
        var sliceColor: Color
        var sliceModel: PieSliceModel
        var id = UUID()
    }
    
    @Published var data: [PieSliceData]
    
    init(data: [PieChartModel.PieSliceData]) {
        self.data = data
    }
}
