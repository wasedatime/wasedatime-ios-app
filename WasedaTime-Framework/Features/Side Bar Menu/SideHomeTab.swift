//
//  SideHomeTab.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct SideHomeTab: View {
    
    @Binding var selectedTab: String
    
    // Hiding Tab Bar ...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Views ...
            HomePage()
                .tag("Home")
            Timetable()
                .tag("Timetable")
            Syllabus()
                .tag("Syllabus")
            AboutUs()
                .tag("About Us")
            Help()
                .tag("Help")
        }
    }
}

struct SideHomeTab_Previews: PreviewProvider {
    static var previews: some View {
        SideMainView()
    }
}

struct HomePage: View {
    var body: some View {
        NavigationView {
            BackgroundHomeView()
        }
    }
}

struct Timetable: View {
    var body: some View {
        NavigationView {
            Text("Timetable")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Timetable")
        }
    }
}

struct Syllabus: View {
    var body: some View {
        NavigationView {
            Text("Syllabus")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Syllabus")
        }
    }
}

struct AboutUs: View {
    var body: some View {
        AboutUsContentView()
    }
}

struct Help: View {
    var body: some View {
        NavigationView {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}
