//
//  SyllabusView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SyllabusView: View {
    
    @EnvironmentObject private var vm: SyllabusViewModel
    
    @State private var longPress: Bool = false
    @State private var addButton: Bool = false
    @Binding var showMenu: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Glassmorphism()
                    .ignoresSafeArea()
                
                VStack {
                    SearchBarView(searchText: $vm.searchText)
                    allSyllabusList
                }
            }
            .navigationTitle("Syllabus")
        }
    }
}

struct SyllabusView_Previews: PreviewProvider {
    static var previews: some View {
        SyllabusView(showMenu: .constant(false))
            .environmentObject(dev.homeVM)
    }
}

extension SyllabusView {
    private var allSyllabusList: some View {
        List(vm.allSyllabus, id: \.self) { syllabi in
            NavigationLink(
                destination: { SyllabusDetailView(syllabus: syllabi) }, label: {
                    SyllabusRowView(syllabus: syllabi)
                }
            )
            .listRowSeparator(.hidden)
            .listRowBackground(Glassmorphism().opacity(0.1))
        }
        .listStyle(.plain)
    }
}
