//
//  SwiftUIView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                VStack {
                    Image("Big Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .leading)
                        .offset(y: UIScreen.main.bounds.height / 30)
                        .padding()
                }
            })
            // Tab Buttons ...
            VStack(alignment: .leading, spacing: 10) {
                SideTabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                SideTabButton(image: "calendar", title: "Timetable", selectedTab: $selectedTab, animation: animation)
                SideTabButton(image: "book", title: "Syllabus", selectedTab: $selectedTab, animation: animation)
                SideTabButton(image: "bus", title: "Campus", selectedTab: $selectedTab, animation: animation)
                SideTabButton(image: "person.2.circle.fill", title: "About Us", selectedTab: $selectedTab, animation: animation)
                SideTabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            SideTabButton(image: "person.circle", title: "Profile", selectedTab: $selectedTab, animation: animation)
                .padding(.leading, -15)
            // About ...
            Text("App Version 1.0.0")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .opacity(0.6)
                .padding()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMainView()
    }
}
