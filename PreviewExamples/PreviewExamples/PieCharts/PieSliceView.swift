//
//  PieSliceView.swift
//  PreviewExamples
//
//  Created by Syakur, Y. (Yusuf) on 20/02/2023.
//

import SwiftUI

struct PieSlice: View {
    var pieSliceData: PieSliceMetrics
    @State var degreeDifference: Double = 0.0
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
    }
    
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
            // ZStack assigns each assigned subview a higher z-axis value than the one before it, meaning later subviews appear "on top" of earlier ones.
            // In this case, Path is on the bottom z-axis and Text is on top.
            ZStack {
                // Path is a view that lets you draw custom shapes.
                // In this case, path is used to add an arc with configurable start- and end angles.
                ArcSlice(startDegrees: pieSliceData.startAngle.degrees, endDegrees: pieSliceData.startAngle.degrees + degreeDifference)
                .fill(pieSliceData.sliceColor)
                .onAnimationCompleted(for: degreeDifference) {
                    print("Animation completed!")
                }
                // Text that is placed in the middle of the arc.
                // This should be made optional.
                Text(pieSliceData.text)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                    )
                    .foregroundColor(pieSliceData.textColor)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                self.degreeDifference = pieSliceData.endAngle.degrees - pieSliceData.startAngle.degrees
            }
        }
    }
}

struct ArcSlice: Shape {
    var startDegrees: Double // Conform VectorArithmetic
    var endDegrees: Double // Conform VectorArithmetic
    
    func path(in rect: CGRect) -> Path {
        
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
    
    // Point out which value to animate
    var animatableData: Double {
        get { return endDegrees }
        set { endDegrees = newValue }
    }
    
}

struct PieSliceMetrics {
    var startAngle: Angle
    var endAngle: Angle
    var text: String
    var sliceColor: Color
    var textColor: Color
}

struct PieSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieSlice(pieSliceData: PieSliceMetrics(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 120.0), text: "30%", sliceColor: Color.black, textColor: Color.white))
    }
}
