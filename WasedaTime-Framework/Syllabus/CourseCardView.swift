//
//  CourseCardView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 24/7/21.
//

import SwiftUI

struct CourseCardView: View {
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.white)
                .frame(height: UIScreen.main.bounds.height / 5)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
            contents
        }
        .padding()
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView()
    }
}

extension CourseCardView {
    
    private var contents: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                // Faculty School Logo
                Image(systemName: "heart.fill")
                
                // Course Title
                Text("First Year Seminar B 14")
                Spacer()
                
                // Course Language
                Text("EN")
                    .bold()
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 5) {
                
                HStack(spacing: 5) {
                    // Course Day and Period
                    Image(systemName: "clock")
                    Text("Sat.3")
                    
                    // Course Location
                    Image(systemName: "map")
                    Text("11-503")
                }
                
                HStack(spacing: 5) {
                    // Course Instructor
                    Image(systemName: "person.fill")
                    Text("YAMASHITA, Hikaru")
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Buttons to Navigate Further
            HStack {
                Image(systemName: "heart.fill")
                Spacer()
                Image(systemName: "person.fill")
                Spacer()
                Image(systemName: "map.fill")
            }
            .padding(.horizontal, UIScreen.main.bounds.width / 10)
        }
        
    }
    
}
