//
//  ApplicationView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct ApplicationView: View {
    
    // MARK: - PROPERTIES
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    @State private var school: String = "FSE"
    let schools = ["FSE", "SILS"]
    
    @State private var type: String = "Undergraduate"
    let types = ["Undergraduate", "Graduate"]
    
    @State private var year: String = "1"
    let years = ["1", "2", "3", "4"]
    
    @State private var interest: String = "Marketing"
    let interests = ["Performance Marketing & Business Operations", "Technology"]
    
    @State private var market: String = "Product Management"
    let marketing = ["Product Management", "Marketing & Advertising", "Business Expansion/Liaison"]
    
    @State private var tech: String = "General Software Developer / Apprentice"
    let technology = ["General Software Developer / Apprentice", "Frontend Developer / Apprentice", "Backend Developer / Apprentice", "Infrastructure Developer / Apprentice"]
    
    @State private var isMarketing: Bool = false
    
    @State private var shortIntro: String = ""
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            Form {
                Section(header: Text("Personal Information").padding(.top, 30)) {
                    TextField("First Name", text: $firstName)
                        .foregroundColor(.black)
                    TextField("Last Name", text: $lastName)
                        .foregroundColor(.black)
                }
                Section(header: Text("School")) {
                    
                    Picker("Years", selection: $year) {
                        ForEach(years, id: \.self) {
                            Text($0)
                        }
                    }
                    .foregroundColor(.black)
                    
                    Picker("Student Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .foregroundColor(.black)
                    
                    Picker("School", selection: $school) {
                        ForEach(schools, id: \.self) {
                            Text($0)
                        }
                    }
                    .foregroundColor(.black)
                }
                Section(header: Text("Interests")) {
                    Toggle(isMarketing ? "Technology" : "Marketing", isOn: $isMarketing.animation())
                    
                    if !isMarketing {
                        Picker("Interests", selection: $market) {
                            ForEach(marketing, id: \.self) {
                                Text($0)
                            }
                        }
                    } else {
                        Picker("Interests", selection: $tech) {
                            ForEach(technology, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                
                Section(header: Text("About You")) {
                    TextEditor(text: $shortIntro)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                
                Section(header: Text("").padding(.top)) {
                    Button {  } label: {
                        Text("Save")
                            .font(Font.custom("Trebuchest MS", size: 20.0))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .foregroundColor(.white)
            .background(Glassmorphism())
            
            
            ZStack(alignment: .topLeading) {
                BackButton()
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
        }
        .navigationBarHidden(true)
    }
}

// MARK: - PREVIEWS
struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ApplicationView()
        }
    }
}
