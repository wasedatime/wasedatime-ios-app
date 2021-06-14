//
//  SyllabusContentView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 10/6/21.
//
// RoundedRectangle() {
//   School_Logo   Course_Title   Language
//   Day           Location
//   Prof
//   --------------------------------------
//   Go_to_Course  Add_Calendar   Review
// }

import SwiftUI

struct SyllabusContentView: View {
    
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Search Bar ...
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(samplePhotos.indices) { index in
                            Image(samplePhotos[index].name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 200)
                                .cornerRadius(10.0)
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        }
                    }
                    .padding(.all, 10)
                }
            }
            .navigationTitle("Syllabus")
        }
    }
}

struct SyllabusContentView_Previews: PreviewProvider {
    static var previews: some View {
        SyllabusContentView()
    }
}
