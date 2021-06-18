//
//  SideMainView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct SideMainView: View {
    
    // Selected Tab ...
    @State var selectedTab = "Home"
    @State var showMenu = false
    
    var body: some View {
        ZStack {
            Color("Gray3")
                .ignoresSafeArea()
            // Side Menu ...
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                SideMenu(selectedTab: $selectedTab)
            })
            ZStack {
                // 2 Background Cards ...
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    // Shadow ...
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    // Shadow ...
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical, 60)
                
                SideHomeTab(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            // Scaling and Moving the View ...
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0 )
            .ignoresSafeArea()
            .overlay(
                // Menu Button ...
                MenuButton()
                .padding()
                .offset(y: UIScreen.main.bounds.height / 30)
                ,alignment: .topLeading
            )
        }
    }
}

struct SideMainView_Previews: PreviewProvider {
    static var previews: some View {
        SideMainView()
    }
}

// Extending View to get Screen Size ...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct MenuButton: View {
    
    @State var showMenu = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                showMenu.toggle()
            }
        }, label: {
            // Animated Drawer Button ...
            VStack(spacing: 5) {
                Capsule()
                    .fill(showMenu ? Color.white : Color.white)
                    .frame(width: 30, height: 3)
                // Rotating ...
                    .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                    .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                VStack(spacing: 5) {
                    Capsule()
                        .fill(showMenu ? Color.white : Color.white)
                        .frame(width: 30, height: 3)
                    // Moving Up When Clicked ...
                    Capsule()
                        .fill(showMenu ? Color.white : Color.white)
                        .frame(width: 30, height: 3)
                        .offset(y: showMenu ? -8 : 0)
                }
                .rotationEffect(.init(degrees: showMenu ? 50 : 0))
            }
            .shadow(color: Color.black.opacity(0.8), radius: 5, x: 0, y: 3)
        })
    }
}
