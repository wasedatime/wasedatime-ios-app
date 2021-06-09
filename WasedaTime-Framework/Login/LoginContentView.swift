//
//  LoginContentView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 10/6/21.
//

import SwiftUI

struct LoginContentView: View {
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9061060548, green: 0.9634222388, blue: 0.8584807515, alpha: 1)), Color(#colorLiteral(red: 0.8086505532, green: 0.6895922422, blue: 0.7916650176, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            ZStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing: 10) {
                        Text("Sign in with")
                            .font(.system(size: 30, weight: .thin, design: .default))
                            .foregroundColor(Color.white)
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                })
                .padding()
                .background(Color("Red"))
                .cornerRadius(15.0)
            }
            WaveView()
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
