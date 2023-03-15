//
//  StockTableViewModel.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 15/03/2023.
//

import Combine

class StockTableViewModel {
    enum State {
        case loading
        case data([StockTableViewData])
        case error
        case empty
    }
    
    struct StockTableViewData {
        let name: String
        let unit: StockUnit
        let amount: Double
        
        enum StockUnit: String {
            case miligram = "mg"
            case gram = "g"
            case kilogram = "kg"
            case litre = "L"
            case piece = "pc"
        }
    }
    
    @Published var state: State = .loading
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        self.state = .loading
        
        // API Call here
        
        self.state = .data([
            StockTableViewData(name: "Tomato", unit: .piece, amount: 2),
            StockTableViewData(name: "Minced meat", unit: .gram, amount: 300),
            StockTableViewData(name: "Lasagna sheets", unit: .gram, amount: 250)]
        )
    }
}
