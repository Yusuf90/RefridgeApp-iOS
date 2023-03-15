//
//  OrderView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 16/01/2023.
//

import SwiftUI

struct OrderView {
    @State var isShowingSheet: Bool = false
}

extension OrderView: View {
    var body: some View {
        let pieSliceItems: [PieSliceItem] = [
            PieSliceItem(name: "Fixed expenses", value: 1300, color: Color(hex: 0xFF6200)),
            PieSliceItem(name: "Transport", value: 500, color: Color(hex: 0x525199)),
            PieSliceItem(name: "Groceries", value: 300, color: Color(hex: 0xAB0066))]
        
        PieChartView(pieSliceItems: pieSliceItems, formatter: {value in String(format: "$%.2f", value)})
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingSheet = true
                }
                label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationStack {
                ProcessingView(displayString: "Processing Order...", isShowingSheet: $isShowingSheet)
            }
        }
        .navigationTitle("Place your order")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderView()
        }
    }
}
