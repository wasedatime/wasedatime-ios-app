//
//  SideMenu.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SideMenu: View {
    
    // MARK: - PROPERTIES
    @State var showGithub: Bool = false
    @State var showTwitter: Bool = false
    @State var showFacebook: Bool = false
    @Binding var showMenu: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                Text("Explore")
                    .font(Font.custom("Trebuchest MS", size: 30.0))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding()
            
            Divider()
                .background(Color.black)
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 35) {
                        // Tab Buttons ...
                        NavigationLink { FeedsView() } label: { TabButton(title: "Feeds", image: "newspaper") }
                        NavigationLink { ApplicationView() } label: { TabButton(title: "Join Us", image: "briefcase") }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 35)
                    
                    Divider()
                        .background(Color.black)
                        .padding(.horizontal)
                        .padding(.vertical)
                    
                    VStack(spacing: 20) {
                        Text("Follow Us on Social!")
                            .font(Font.custom("Trebuchest MS", size: 20.0))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Label(title: { Text("Github") }, icon: { Image("Github").renderingMode(.template).foregroundColor(Color("Red")) })
                                .onTapGesture { showGithub.toggle() }
                                .sheet(isPresented: $showGithub) {
                                    SFSafariViewWrapper(url: URL(string: "https://github.com/wasedatime")!)
                                }
                            
                            Label(title: { Text("Twitter") }, icon: { Image("Twitter").renderingMode(.template).foregroundColor(Color("Red")) })
                                .onTapGesture { showTwitter.toggle() }
                                .sheet(isPresented: $showTwitter) {
                                    SFSafariViewWrapper(url: URL(string: "https://twitter.com/WasedaTime")!)
                                }
                            
                            Label(title: { Text("Facebook") }, icon: { Image("Facebook").renderingMode(.template).foregroundColor(Color("Red")) })
                                .onTapGesture { showFacebook.toggle() }
                                .sheet(isPresented: $showFacebook) {
                                    SFSafariViewWrapper(url: URL(string: "https://www.facebook.com/wasedatime")!)
                                }
                        }
                        .foregroundColor(Color("Red"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        // Max Width ...
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color("White2")
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - FUNCTIONS
    @ViewBuilder
    func TabButtonLink(title: String, image: String, url: String) -> some View {
        // for Navigation ...
        // Simply replace Button with NavigationLink
        Link(destination: URL(string: url)!) {
            HStack(spacing: 14) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    func TabButton(title: String, image: String) -> some View {
        // for Navigation ...
        // Simply replace Button with NavigationLink
        HStack(spacing: 14) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
            Text(title)
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - PREVIEW
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - EXTENSIONS etc.
// Extending View to get Screen Rect ...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
