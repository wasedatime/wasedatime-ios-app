//
//  TimetableView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct TimetableView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showMenu: Bool
    @State var selectedDay: String = "M"
    @State var selectedSemester: String = "Spring"
    
    var days = ["M", "T", "W", "T", "F", "S", "S"]
    var semester = ["Spring", "Summer", "Fall", "Winter"]
    var times = ["09:00 AM", "10:40 AM", "13:00 PM", "14:45 PM", "16:30 PM"]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            Glassmorphism()
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    GeometryReader { geometry in
                        VStack {
                            if geometry.frame(in: .global).minY <= 0 {
                                Image(colorScheme == .dark ? "wasedaNight" : "waseda")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
                                    .offset(y: geometry.frame(in: .global).minY / 9)
                                    .clipped()
                            } else {
                                Image(colorScheme == .dark ? "wasedaNight" : "waseda")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                    .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                            }
                        }
                    }
                    .frame(height: 400)
                    .edgesIgnoringSafeArea(.top)
                    
                    VStack(spacing: 20) {
                        Picker("Select Day", selection: $selectedDay) {
                            ForEach(days, id: \.self) { day in
                                Text(day)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Picker("Select Semester", selection: $selectedSemester) {
                            ForEach(semester, id: \.self) { sem in
                                Text(sem)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        LazyHStack(alignment: .top, spacing: 20) {
                            VStack(spacing: 30) {
                                ForEach(times, id: \.self) { time in
                                    HStack(alignment: .top, spacing: 30) {
                                        Text(time)
                                        VStack(spacing: 10) {
                                            Circle()
                                                .frame(width: 40, height: 40)
//                                                .overlay(Image("SILS"))
                                            RoundedRectangle(cornerRadius: 2.5)
                                                .frame(width: 5)
                                                .frame(height: 50)
                                        }
                                        // TimetableRowView()
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - EXTENSIONS etc.
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
