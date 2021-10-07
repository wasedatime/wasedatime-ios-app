//
//  PieChartView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct PieChartView: View {
    
    public let values: [Int]
    public var colors: [Color]
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Int = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Int = Int(value * 360 / sum)
            tempSlices.append(PieSliceData(
                startAngle: Angle(degrees: Double(endDeg)),
                endAngle: Angle(degrees: Double(endDeg + degrees)),
//                text: String(format: "%.0f%%", Int(value * 100 / sum)),
                color: self.colors[i]
            ))
            endDeg += degrees
        }
        return tempSlices
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.values.count){ i in
                    PieSliceView(pieSliceData: self.slices[i])
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
            }
            .foregroundColor(Color.white)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(values: [1300, 500, 300], colors: [Color.blue, Color.green, Color.orange])
    }
}
