//
//  BaseView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct BaseView: View {
    
    // MARK: - PROPERTIES
    @State var showMenu: Bool = false
    @State var currentTab = "search"
    // Hiding Native One ...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // Offset for both DragGesture and showMenu ...
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    // Gesture Offset ...
    @GestureState var gestureOffset: CGFloat = 0
    
    // MARK: - BODY
    var body: some View {
        let sideBarWidth = getRect().width - 90
        // Whole Navigation View ...
        ZStack {
            LinearGradient(
                colors: [Color("Gray2"), Color("Gray3")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            HStack(spacing: 0) {
                // Side Menu ...
                SideMenu(showMenu: $showMenu)
                
                // Main Tab View ...
                VStack(spacing: 0) {
                    TabView(selection: $currentTab) {
                        HomeView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("search")
                        
                        TimetableView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("calendar-alt")
                        
                        SyllabusView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("book")
                        
                        CampusView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bus")
                    }
                    
                    // Custom Tab Bar ...
                    VStack(spacing: 0) {
                        
                        Divider()
                            .background(Color.white)
                        
                        HStack(spacing: 0) {
                            // Tab Buttons ...
                            TabButton(image: "search")
                            TabButton(image: "calendar-alt")
                            TabButton(image: "book")
                            TabButton(image: "bus")
                        }
                        .padding(.vertical, 15)
                    }
                }
                .frame(width: getRect().width)
                
                // BG when showMenu ...
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth)) / 5)
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
            }
            // Max Size ...
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x:  offset > 0 ? offset : 0)
            // Gesture ...
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            // No Navigation Bar Title ...
            // Hiding Navigation Bar
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    // MARK: - FUNCTIONS
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button { withAnimation { currentTab = image } } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? Color("Red") : .gray)
                .frame(maxWidth: .infinity)
                .shadow(color: currentTab == image ? .white : .clear, radius: 5.0)
        }
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let sideBarWidth = getRect().width - 90
        let translation = value.translation.width
        
        withAnimation {
            // Checking ...
            if translation > 0 {
                if translation > sideBarWidth / 2 {
                    // showMenu
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    // Extra Cases ...
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                if -translation > sideBarWidth / 2 {
                    // showMenu
                    offset = 0
                    showMenu = false
                } else {
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        
        // Storing lastOffset ...
        lastStoredOffset = offset
        
    }
}

// MARK: - PREVIEW
struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BaseView()
        }
    }
}
