//
//  CategorisationPieChartView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 20/02/2023.
//

import SwiftUI

struct CategorisationPieChartView: View {
    
    var pieSliceItems: [PieSliceItem]
    let formatter: (Double) -> String
    var backgroundColor: Color = Color.white
    
    private enum Constants {
        static let widthFraction: CGFloat = 0.75
        static let innerRadiusFraction: CGFloat = 0.60
        static let selectScaleFactor: CGFloat = 1.05
        static let opacityFactor: CGFloat = 0.5
    }
    
    let model: PieChartModel
    
    @State private var activeIndex: Int
    
    private let totalText: String = "Total"
    private let totalIndex: Int = -1
    
    var slices: [PieSliceModel] {
        let sum = pieSliceItems.map{$0.value}.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceModel] = []
        
        for (_, value) in pieSliceItems.enumerated() {
            let degrees: Double = value.value * 360 / sum
            tempSlices.append(PieSliceModel(startAngle: Angle(degrees: endDeg),
                                              endAngle: Angle(degrees: endDeg + degrees)))
            endDeg += degrees
        }
        return tempSlices
    }
    
    init(pieSliceItems: [PieSliceItem],
                formatter: @escaping (Double) -> String){
        self.pieSliceItems = pieSliceItems
        self.formatter = formatter
        self.activeIndex = totalIndex
        self.model = PieChartModel(data: [])
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack{
                    ForEach(0..<self.pieSliceItems.count, id: \.self) { i in
                        PieSlice(pieSliceModel: self.slices[i])
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    self.activeIndex = self.activeIndex == i ? totalIndex : i
                                }
                            }
                            .scaleEffect(self.activeIndex == i ? Constants.selectScaleFactor : 1)
                            .opacity(self.activeIndex == i || self.activeIndex == totalIndex ? 1.0 : Constants.opacityFactor)
                    }
                    .frame(width: Constants.widthFraction * geometry.size.width, height: Constants.widthFraction * geometry.size.width)
                    // Inner circle
                    Circle()
                        .fill(self.backgroundColor)
                        .frame(width: Constants.widthFraction * geometry.size.width * Constants.innerRadiusFraction, height: Constants.widthFraction * geometry.size.width * Constants.innerRadiusFraction)
                    
                    // Text for inner circle
                    VStack {
                        Text(self.activeIndex == totalIndex ? self.totalText : pieSliceItems[self.activeIndex].name)
                            .font(.title)
                            .foregroundColor(Color.gray)
                        Text(self.formatter(self.activeIndex == totalIndex ? pieSliceItems.map{$0.value}.reduce(0, +) : pieSliceItems[self.activeIndex].value))
                            .font(.title)
                    }
                    
                } // ZStack
                // Add selector here
                Picker(
                    "Category",
                    selection: Binding(
                        get: { activeIndex },
                        set: { newValue in
                            withAnimation(.spring()) {
                                activeIndex = newValue
                            }
                        }
                    )
                ) {
                    Text(self.totalText)
                        .tag(totalIndex)
                    ForEach(pieSliceItems.indices, id: \.self) { (index: Int) in
                        Text(self.pieSliceItems[index].name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .transaction { transaction in
                    transaction.animation = nil
                }
                
                // Add legenda to the whole view
                CategorisationPieChartRows(pieSliceItems: pieSliceItems)
            } // VStack
            .background(self.backgroundColor)
        }
    }
}

struct PieSliceItem {
    let name: String
    let value: Double
    let color: Color
}

struct CategorisationPieChartRows: View {
    var pieSliceItems: [PieSliceItem]
    
    var body: some View {
        VStack{
            ForEach(0..<self.pieSliceItems.count, id: \.self){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.pieSliceItems[i].color)
                        .frame(width: 20, height: 20)
                    Text(self.pieSliceItems[i].name)
                        .foregroundColor(Color.black)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(String(format: "€%.2f", self.pieSliceItems[i].value))
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct CategorisationPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        let pieSliceItems: [PieSliceItem] = [
            PieSliceItem(name: "Fixed expenses", value: 1300, color: Color(hex: 0xFF6200)),
            PieSliceItem(name: "Transport", value: 500, color: Color(hex: 0x525199)),
            PieSliceItem(name: "Groceries", value: 300, color: Color(hex: 0xAB0066)),
            PieSliceItem(name: "Shopping", value: 20, color: Color(hex: 0xFF0066))
        ]
        
        CategorisationPieChartView(pieSliceItems: pieSliceItems,
                     formatter: {value in String(format: "€%.2f", value)})
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
