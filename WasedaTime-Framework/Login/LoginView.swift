//
//  LoginView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 10/6/21.
//

import SwiftUI

struct LoginView: View {
    
    let title: String
    let icon: String
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                LoginRow(title: title, icon: icon)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.horizontal, 30)
        }
        .padding(.bottom, 30)
    }
}

struct LoginRow: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
                .foregroundColor(Color(#colorLiteral(red: 0.368627451, green: 0.3843137255, blue: 0.4117647059, alpha: 1)))
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.368627451, green: 0.3843137255, blue: 0.4117647059, alpha: 1)))
        }
        .padding(.horizontal, 16)
    }
}
