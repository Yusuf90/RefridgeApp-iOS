//
//  PieChartViewModel.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 21/03/2023.
//

import Foundation
import SwiftUI

final class PieChartViewModel {
    
    // MARK: - Internal properties
    
    // MARK: - Initializers
    
    // MARK: - Internal methods
    
    func getPieChartData() -> [PieChartModel.PieSliceData]? {
        
        // API Call
        
        let pieSliceMockData = PieChartModel(data: [
            PieChartModel.PieSliceData(name: "Fixed Expenses", value: 1300, sliceColor: Color.red),
            PieChartModel.PieSliceData(name: "Restaurant & Bars", value: 300, sliceColor: Color.blue),
            PieChartModel.PieSliceData(name: "Groceries", value: 450, sliceColor: Color.green)
        ])
        
        return pieSliceMockData.data
    }
    
}
