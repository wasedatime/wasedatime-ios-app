//
//  WaveView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 10/6/21.
//

import SwiftUI

struct WaveView: View {
    
    let screen = UIScreen.main.bounds
    @State var isAnimated = false
    
    var body: some View {
        return ZStack {
            getWavePath(interval: screen.width, amplitude: 150, base:  100 + screen.height/2)
                .foregroundColor(Color("Red").opacity(0.4))
                .offset(x: isAnimated ? -1*screen.width : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false)
                )
            getWavePath(interval: screen.width*1.2, amplitude: 130, base: 120 + screen.height/2)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3))
                .offset(x: isAnimated ? -1*screen.width*1.2 : 0)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false)
                )
            getWavePath(interval: screen.width*1.5, amplitude: 100, base: 140 + screen.height/2)
                .foregroundColor(Color("Red").opacity(0.6))
                .offset(x: isAnimated ? -1*screen.width*1.5 : 0)
                .animation(
                    Animation.linear(duration: 3)
                        .repeatForever(autoreverses: false)
                )
        }.onAppear() {
            self.isAnimated = true
        }
    }
    func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, base: CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: base))
            path.addCurve(
                to: CGPoint(x: 1*interval , y: base),
                control1: CGPoint(x: interval * (0.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (0.65), y: -amplitude + base)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval , y: base),
                control1: CGPoint(x: interval * (1.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (1.65), y: -amplitude + base)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: screen.height))
            path.addLine(to: CGPoint(x: 0, y: screen.height))
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
