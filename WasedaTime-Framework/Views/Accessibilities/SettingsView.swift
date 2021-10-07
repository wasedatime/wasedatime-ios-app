//
//  SettingsView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    @Binding var presentSettings: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .shadow(color: .black.opacity(0.6), radius: 10.0)
                .ignoresSafeArea()
            
            ZStack(alignment: .topTrailing) {
                Button { presentSettings.toggle() } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.4), radius: 5.0)
                        .frame(width: 30, height: 30)
                        .padding()
                        .padding(.horizontal)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            VStack(spacing: 50) {
                Button {  } label: {
                    VStack {
                        Rectangle()
                            .foregroundColor(Color("Red"))
                            .frame(width: 70, height: 70)
                            .cornerRadius(20.0)
                            .overlay(
                                Text("A")
                                    .foregroundColor(.white)
                                    .font(Font.custom("", size: 30.0))
                        )
                        Text("English")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                Button {  } label: {
                    VStack {
                        Rectangle()
                            .foregroundColor(Color(.systemTeal))
                            .frame(width: 70, height: 70)
                            .cornerRadius(20.0)
                            .overlay(
                                Text("文")
                                    .foregroundColor(.white)
                                    .font(Font.custom("", size: 30.0))
                        )
                        Text("日本語")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                Button {  } label: {
                    VStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 70, height: 70)
                            .cornerRadius(20.0)
                            .overlay(
                                Image(systemName: "power")
                                    .foregroundColor(.white)
                                    .font(Font.custom("", size: 30.0))
                        )
                        Text("Sign Out")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
