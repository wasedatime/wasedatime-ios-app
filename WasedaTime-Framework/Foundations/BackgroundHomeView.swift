//
//  BackgroundHomeView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct BackgroundHomeView: View {
    
    // MARK: - PROPERTIES
    @State private var showingModal = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND IMAGE
            GeometryReader { geometry in
                Image("waseda")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Color.black.opacity(0.3)
            }
            .ignoresSafeArea()
            // MARK: - ALIGNS THE CONTENT OF THE HOME PAGE
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - WASEDATIME LOGO AND TITLE
                    Image("Big Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding()
                        .padding(.top, 30)
                    Text("Welcome to WasedaTime!")
                        .font(.system(size: 35))
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5, x: 1, y: 10)
                    Spacer(minLength: 5)
                    // MARK: - NEW FEATURES BUTTON
                    Button(action: {
                        self.showingModal.toggle()
                    }, label: {
                        Text("New features")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Red"))
                            .cornerRadius(15.0)
                    })
                    .popover(isPresented: $showingModal) {
                        Text("No new features")
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct BackgroundHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundHomeView()
    }
}
