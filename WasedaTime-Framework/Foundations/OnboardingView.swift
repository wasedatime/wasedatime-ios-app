//
//  ContentView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages {
            TabBarView(viewRouter: TabBarViewRouter())
        } else {
            WalkthroughScreen()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// Walkthrough Screen ...
struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        // For Slide Animation ...
        ZStack {
            // Changing Between Views ...
            if currentPage == 1 {
                ScreenView(image: "review", title: "Step 1", detail: "Lorem ipsum is dummy text used in print, graphics or web designs.", bgColor: Color("Red"))
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "timetable1", title: "Step 2", detail: "Lorem ipsum is dummy text used in print, graphics or web designs.", bgColor: Color("Red"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "timetable2", title: "Step 3", detail: "Lorem ipsum is dummy text used in print, graphics or web designs.", bgColor: Color("Red"))
                    .transition(.scale)
            }
        }
        .overlay(
            // Button ...
            Button(action: {
                // Changing Views ...
                withAnimation(.easeInOut) {
                    // Checking ...
                    if currentPage <= totalPages {
                        currentPage += 1
                    } else {
                        // For App Testing Only ...
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                // Circular Slider ...
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom, 20)
            ,alignment: .bottom
        )
    }
}
struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                // Showing it only for the First Page ...
                if currentPage == 1 {
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        // Letter Spacing ...
                        .kerning(1.4)
                } else {
                    // Back Button ...
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10.0)
                    })
                }
                
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .padding(.bottom, 50)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top)
            // Change with your own thing ...
            Text(detail)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            // Minimum Spacing when Phone is Reducing ...
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10.0).ignoresSafeArea())
    }
}
// Total Pages ...
var totalPages = 3
