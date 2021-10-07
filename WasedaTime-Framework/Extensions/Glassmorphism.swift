//
//  Glassmorphism.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct Glassmorphism: View {
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [Color("Gray2"), Color("Gray3")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            GeometryReader { proxy in
                
                let size = proxy.size
                
                Color.black
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color("Red"))
                    .padding(50)
                    .blur(radius: 120)
                // Moving Top ...
                    .offset(x: -size.width / 1.8, y: -size.height / 5)
                
                Circle()
                    .fill(Color("Gray2"))
                    .padding(50)
                    .blur(radius: 90)
                // Moving Top ...
                    .offset(x: size.width / 1.8, y: -size.height / 2)
                
                Circle()
                    .fill(Color("BrightColor"))
                    .padding(50)
                    .blur(radius: 150)
                // Moving Top ...
                    .offset(x: size.width / 1.8, y: size.height / 2)
            }
        }
    }
}

struct Glassmorphism_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphism()
    }
}
