//
//  PieSliceView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 20/02/2023.
//

import SwiftUI

struct PieSlice: View {
    let pieSliceModel: PieSliceModel
    
    private enum Constants {
        static let animationDuration: Double = 1.0
    }
    
    private var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceModel.startAngle + pieSliceModel.endAngle).radians / 2.0
    }
    
    @State var degreeDifference: Double = 0.0
    @State var sliceColor: Color = Color.black
    
    var body: some View {
        // GeometryReader acts as a container to represent its parent view.
        // There are three coordinate spaces available to use in geometry reader:
        // - Global: Frame relative to the whole screen/superview i.e. the whole content view
        //      Example: geometryReader.frame(in: .global).<attribute of frame>
        // - Local: Frame relative to the immediate parent view
        //      Example: geometryReader.frame(in: .local).<attribute of frame>
        // - Custom: The custom coordinate space (identifying a view by adding .coordinateSpace(name: "<name goes here>"))
        //      You can see this as a <div> identifier in Web Development
        //      Example: geometryReader.frame(in: .named("<name goes here>")).<attribute of frame>
        GeometryReader { geometry in
            
            // The pie slice object
            ArcSlice(startDegrees: pieSliceModel.startAngle.degrees, endDegrees: pieSliceModel.startAngle.degrees + degreeDifference)
            .fill(sliceColor)
            .onAnimationCompleted(for: degreeDifference) {
                print("Animation completed!")
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(.easeInOut(duration: Constants.animationDuration)) {
                self.degreeDifference = pieSliceModel.endAngle.degrees - pieSliceModel.startAngle.degrees
            }
        }
    }
}


struct ArcSlice: Shape {
    let startDegrees: Double // Conform VectorArithmetic
    var endDegrees: Double // Conform VectorArithmetic
    
    // Point out which value to animate
    var animatableData: Double {
        get { return endDegrees }
        set { endDegrees = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        // Path is a view that lets you draw custom shapes.
        // In this case, path is used to add an arc with configurable start- and end angles.
        var p = Path()
        // Move the path to the center point of the container view.
        // This is the starting point of the path.
        p.move(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.5))
        
        // Adds an arc with both start- and end angles
        p.addArc(center: CGPoint(x: rect.width * 0.5, y: rect.height * 0.5),
                 radius: rect.width * 0.5,
                 startAngle: Angle(degrees: -90.0) + Angle(degrees: startDegrees),
                 endAngle: Angle(degrees: -90.0) + Angle(degrees: endDegrees),
                 clockwise: false)
        
        // Closes the path from current point to starting point
        p.closeSubpath()
        
        return p
    }
}

struct PieSliceModel: Identifiable {
    let startAngle: Angle
    let endAngle: Angle
    var id = UUID()
}

struct PieSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieSlice(pieSliceModel: PieSliceModel(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 120.0)))
    }
}
