//
//  HomeView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @Binding var showMenu: Bool
    @State var presentSettings: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // Gloss Background ...
            Glassmorphism()
            
            VStack {
                header
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Hi, Waseda")
                                .font(Font.custom("Trebuchest MS", size: 40.0))
                            Text("Welcome back")
                                .font(Font.custom("Trebuchest MS", size: 20.0))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        // Content ...
                    }
                }
            }
            if presentSettings {
                SettingsView(presentSettings: $presentSettings)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
            }
        }
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - EXTENSIONS etc.
extension HomeView {
    private var header: some View {
        VStack(spacing: 0) {
            HStack {
                Button { withAnimation { showMenu.toggle() } } label: {
                    Image("hamburger-menu-white")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 20)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        presentSettings.toggle()
                    }
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Divider()
                .background(Color.white)
        }
    }
}

struct StudentCard: View {
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .opacity(0.1)
                .background(
                    Color.white
                        .opacity(0.08)
                        .blur(radius: 10.0)
                )
                // Strokes ...
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(
                            .linearGradient(.init(colors: [
                                Color("Red"), Color("Red").opacity(0.5), .clear, Color("BrightColor")
                            ]), startPoint: .topLeading, endPoint: .bottomTrailing),
                            lineWidth: 2.0
                        )
                        .padding(2.0)
                )
            // Shadows ...
                .shadow(color: .black.opacity(0.1), radius: 5.0, x: -5.0, y: -5.0)
                .shadow(color: .black.opacity(0.1), radius: 5.0, x: 5.0, y: 5.0)
            
            VStack(alignment: .trailing, spacing: 0) {
                HStack(alignment: .top) {
                    Button {
                        
                    } label: { Image(systemName: "chevron.left") }
                    
                    Spacer()
                    
                    Text("Waseda University")
                        .font(Font.custom("Trebuchest MS", size: 20.0))
                        .italic()
                }
                .padding(.top)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .background(
                    Color("Red")
                        .frame(maxWidth: .infinity)
                        .cornerRadius(25.0, corners: [.topLeft, .topRight])
                )
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .foregroundColor(Color("Gray1").opacity(0.7))
                    .padding(.bottom)
                
                Text("Student Information")
                    .font(Font.custom("Trebuchest MS", size: 25.0))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Text("Wilheim Albert")
                        .font(Font.custom("Andale Mono", size: 20.0))
                    
                    Spacer()
                    
                    Text("****** 01")
                }
                .font(Font.custom("American Typewriter", size: 20.0))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            
        }
        .frame(width: width / 1.1, height: height / 4)
    }
}
