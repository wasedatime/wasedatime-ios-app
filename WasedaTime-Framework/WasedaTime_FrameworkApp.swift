//
//  WasedaTime_FrameworkApp.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

@main
struct WasedaTime_FrameworkApp: App {
    
    @StateObject private var vm = SyllabusViewModel()
    
    @State var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.clear)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    OnboardingView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(.stack)
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchScreenView(showLaunchView: $showLaunchView)
                            .transition(AnyTransition.opacity.animation(.easeOut(duration: 1.0)))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
