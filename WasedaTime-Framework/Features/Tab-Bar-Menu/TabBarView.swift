//
//  TabBarView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//
//  Tool Bar ...

import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewRouter: TabBarViewRouter
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    SideMainView()
                case .timetable:
                    TimetableContentView()
                case .syllabus:
                    SyllabusContentView()
                case .user:
                    Profile()
                }
                Spacer()
                ZStack {
//                    if showPopUp {
//                        PlusMenu(widthAndHeight: geometry.size.width / 7)
//                            .offset(y: -geometry.size.height / 6)
//                    }
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width / 4, height: geometry.size.height / 28, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .timetable, width: geometry.size.width / 4, height: geometry.size.height / 28, systemIconName: "calendar", tabName: "Timetable")
//                        ZStack {
//                            Circle()
//                                .foregroundColor(.white)
//                                .frame(width: geometry.size.width / 7, height: geometry.size.width / 7)
//                                .shadow(radius: 4)
//                            Image(systemName: "plus.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: geometry.size.width / 7 - 6, height: geometry.size.height / 7 - 6)
//                                .foregroundColor(Color("Red"))
//                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
//                        }
//                        .offset(y: -geometry.size.height / 8 / 2)
//                        .onTapGesture {
//                            withAnimation {
//                                showPopUp.toggle()
//                            }
//                        }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .syllabus, width: geometry.size.width / 4, height: geometry.size.height / 28, systemIconName: "book", tabName: "Syllabus")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width / 4, height: geometry.size.height / 28, systemIconName: "person.crop.circle", tabName: "Profile")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(Color("White2"))
                    .shadow(radius: 2)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: TabBarViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: TabBarViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -5)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("Red") : Color.gray)
    }
}

//struct PlusMenu: View {
//
//  let widthAndHeight: CGFloat
//
//  var body: some View {
//    HStack(spacing: 50) {
//      ZStack {
//        Button(action: {}, label: {
//            ZStack {
//                Circle()
//                  .foregroundColor(Color("Red"))
//                  .frame(width: widthAndHeight, height: widthAndHeight)
//                Image(systemName: "bus")
//                  .resizable()
//                  .aspectRatio(contentMode: .fit)
//                  .padding(15)
//                  .frame(width: widthAndHeight, height: widthAndHeight)
//                  .foregroundColor(.white)
//            }
//        })
//      }
//      ZStack {
//        Button(action: {}, label: {
//            ZStack {
//                Circle()
//                  .foregroundColor(Color("Red"))
//                  .frame(width: widthAndHeight, height: widthAndHeight)
//                Image(systemName: "signature")
//                  .resizable()
//                  .aspectRatio(contentMode: .fit)
//                  .padding(15)
//                  .frame(width: widthAndHeight, height: widthAndHeight)
//                  .foregroundColor(.white)
//            }
//        })
//      }
//    }
//    .transition(.scale)
//  }
//}
