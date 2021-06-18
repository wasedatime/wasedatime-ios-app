//
//  SideHomeTab.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct SideHomeTab: View {
    
    @Binding var selectedTab: String
    
    // Hiding Tab Bar 
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Views ...
            HomePage()
                .tag("Home")
            Campus()
                .tag("Campus")
            Feeds()
                .tag("Feeds")
            AboutUs()
                .tag("About Us")
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


struct AboutUs: View {
    var body: some View {
        AboutUsContentView()
    }
}

struct Campus: View {
    var body: some View {
        BusView()
    }
}

struct Feeds: View {
    var body: some View {
        FeedTrialContentView()
    }
}

struct Profile: View {
    var body: some View {
        NavigationView {
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Profile")
        }
    }
}
