//
//  SyllabusDetailView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SyllabusDetailView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @State var expandContent: Bool = false
    
    let syllabus: Syllabus
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let colorsArray = [Color.theme.red, Color.theme.gray3, Color.theme.bright, Color.theme.white2, Color.blue, Color.pink, Color.green, Color.orange, Color.purple, Color.yellow]
    
    var evaluationPercentages: [Int] = []
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            Glassmorphism()
            
            VStack(alignment: .leading, spacing: 10) {
                dismissButton
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                topContent
                introductoryDetails
                
                if expandContent {
                    ScrollView(.vertical, showsIndicators: false) {
                        detailedContents
                            .transition(AnyTransition.opacity.animation(.easeInOut))
                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarHidden(true)
    }
    
    // MARK: FUNCTIONS
    // Returns an Array of Percentages (type Int)
    private func percentagesArray() -> [Int] {
        var arraysP: [Int] = []
        for eval in syllabus.evaluations {
            arraysP.append(eval.percentage)
        }
        return arraysP
    }
    
    // Returns term (type String) from a switch-case statement
    private func syllabusTerm() -> String {
        var textTerm: String = ""
        switch syllabus.term {
        case "0s":
            textTerm = "Spring Semester"
        case "2s":
            textTerm = "Fall Semester"
        case "0q":
            textTerm = "Spring Quarter"
        case "1q":
            textTerm = "Summer Quarter"
        case "2q":
            textTerm = "Fall Quarter"
        case "3q":
            textTerm = "Winter Quarter"
        case "f":
            textTerm = "Full Year"
        case "0":
            textTerm = "Spring"
        case "1":
            textTerm = "Summer"
        case "2":
            textTerm = "Fall"
        case "3":
            textTerm = "Winter"
        case "0i":
            textTerm = "Spring Intensive"
        case "2i":
            textTerm = "Fall Intensive"
        case "0t":
            textTerm = "Spring Term"
        case "2t":
            textTerm = "Fall Term"
        case "3t":
            textTerm = "Winter Term"
        case "0t/1t":
            textTerm = "Spring/Summer Term"
        case "0s/2s":
            textTerm = "Spring/Fall Semester"
        case "2t/3t":
            textTerm = "Fall/Winter Term"
        case "1&2s":
            textTerm = "Spring & Fall Semester"
        case "0s&1":
            textTerm = "Spring Semester and Summer"
        case "f/2s":
            textTerm = "Full Year/Fall Semester"
        default:
            textTerm = "Spring Intensive & Winter Intensive"
        }
        return textTerm
    }
    
    // Returns type (type String) from a switch-case statement
    private func syllabusType() -> String {
        var textType: String = ""
        switch syllabus.type {
        case -1:
            textType = "N/A"
        case 0:
            textType = "Lecture"
        case 1:
            textType = "Seminar"
        case 2:
            textType = "Work"
        case 3:
            textType = "Foreign Language"
        case 4:
            textType = "On-demand"
        case 5:
            textType = "Thesis"
        case 6:
            textType = "Graduate Research"
        case 7:
            textType = "Practice"
        default:
            textType = "Blended"
        }
        return textType
    }
    
    // Returns level (type String) from a switch-case statement
    private func syllabusLevel() -> String {
        var textLevel: String = ""
        switch syllabus.level {
        case -1:
            textLevel = "N/A"
        case 0:
            textLevel = "Beginner"
        case 1:
            textLevel = "Intermediate"
        case 2:
            textLevel = "Advanced"
        case 3:
            textLevel = "Final-stage"
        case 4:
            textLevel = "Master"
        default:
            textLevel = "Doctor"
        }
        return textLevel
    }
    
    // Returns language (type String) from an array of languages and switch-case statement
    private func syllabusLanguages() -> String {
        var textLanguage: String = ""
        for lang in syllabus.languages {
            switch lang {
            case -1:
                textLanguage = "N/A"
            case 0:
                textLanguage = "JP"
            case 1:
                textLanguage = "EN"
            case 2:
                textLanguage = "DE"
            case 3:
                textLanguage = "FR"
            case 4:
                textLanguage = "ZH"
            case 5:
                textLanguage = "ES"
            case 6:
                textLanguage = "KO"
            case 7:
                textLanguage = "RU"
            case 8:
                textLanguage = "ITA"
            default:
                textLanguage = "Oth"
            }
        }
        return textLanguage
    }
    
    // Returns day (type String) from an array of occurrences and switch-case statement
    private func dayOccurrences() -> String {
        var textDay: String = ""
        for occur in syllabus.occurrences {
            switch occur.day {
            case -1:
                textDay = "Oth"
            case 0:
                textDay = "Mon"
            case 1:
                textDay = "Tue"
            case 2:
                textDay = "Wed"
            case 3:
                textDay = "Thu"
            case 4:
                textDay = "Fri"
            case 5:
                textDay = "Sat"
            default:
                textDay = "Sun"
            }
        }
        return textDay
    }
}

// MARK: - PREVIEW
struct SyllabusDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SyllabusDetailView(syllabus: dev.syllabus)
    }
}

// MARK: - EXTENSIONS
extension SyllabusDetailView {
    
    // MARK: - RETURNS TO SYLLABUSVIEW HIERARCHY
    private var dismissButton: some View {
        Button { dismiss() } label: {
            Image(systemName: "xmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(colorScheme == .dark ? .white : .theme.red)
                .shadow(color: colorScheme == .dark ? .white.opacity(0.7) : .clear, radius: 10, x: 0, y: 0)
        }
        .frame(width: 40, height: 40)
        .padding(.horizontal)
    }
    
    // MARK: - NAVIGATION TITLE
    private var topContent: some View {
        HStack {
            Text(syllabus.titleEN)
                .font(.title)
                .fontWeight(.semibold)
                .frame(width: 250, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }
    
    // MARK: - COURSE INTRODUCTION DETAILS
    private var introductoryDetails: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image("SILS")
                Text(syllabusLanguages())
                Image(systemName: "radio")
                
                Spacer()
                
                Button("Add") {}
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.regular)
                    .shadow(color: .white.opacity(0.4), radius: 5, x: 0, y: 0)
            }
            
            HStack {
                Text("2021")
                
                // MARK: - TERM
                Text(syllabusTerm())
            }
            
            if !syllabus.occurrences.isEmpty {
                HStack(spacing: 10) {
                    HStack(spacing: 3) {
                        Image(systemName: "clock")
                        Text(dayOccurrences())
                        ForEach(syllabus.occurrences, id: \.self) { occur in
                            Text(".\(occur.period)")
                        }
                    }
                    
                    HStack(spacing: 3) {
                        Image(systemName: "mappin")
                        ForEach(syllabus.occurrences, id: \.self) { occur in
                            Text(occur.location)
                        }
                    }
                }
            }
            
            Text(syllabus.nameEN)
            
            // MARK: - TOGGLE HIDDEN DETAIL VIEW
            Button {
                withAnimation(.easeIn) {
                    expandContent.toggle()
                }
            } label: {
                Image(systemName: "chevron.down")
                    .foregroundColor(.theme.white)
                    .rotationEffect(.degrees(expandContent ? 180 : 0))
            }
            .frame(maxWidth: .infinity)
            .padding([.vertical, .horizontal], 10)
            .background(Color.white.opacity(0.5))
            .cornerRadius(10.0)
            .shadow(color: .white.opacity(0.3), radius: 5, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    // MARK: - HIDDEN DETAIL VIEW
    private var detailedContents: some View {
        VStack {
            // MARK: - DETAILS, MINYEAR, CREDITS ...
            HStack {
                VStack {
                    if syllabus.minYear == -1 {
                        Text("Unknown")
                            .font(.headline)
                    } else {
                        Text("\(syllabus.minYear)+")
                            .font(.headline)
                    }
                    Text("ELIGIBLE YEAR")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack {
                    if syllabus.credit == -1 {
                        Text("Unknown")
                    } else {
                        Text("\(syllabus.credit)")
                            .font(.headline)
                    }
                    Text("CREDIT")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "radio")
                        .font(.headline)
                    Text("REALTIME STREAMING?")
                        .font(.subheadline)
                }
            }
            
            // MARK: - BOX DETAILS
            HStack(spacing: 50) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Type")
                    Text("Category")
                    Text("Level")
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(syllabusType())
                    
                    Text(syllabus.categoryEN)
                    
                    Text(syllabusLevel())
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.black.opacity(0.3))
            .cornerRadius(10.0)
            
            // MARK: - PIE CHART VIEWS
            VStack(alignment: .leading, spacing: 20) {
                if syllabus.evaluations.isEmpty {
                    Text("")
                } else {
                    HStack(spacing: 10) {
                        Rectangle()
                            .fill(Color.theme.red)
                            .frame(width: 5, height: 25, alignment: .leading)
                        
                        Text("Evaluation")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    
                    PieChartView(values: percentagesArray(), colors: colorsArray)
                        .frame(width: 150, height: 150)
                    
                    ForEach(syllabus.evaluations, id: \.self) { eval in
                        if eval.percentage != 0 {
                            VStack(spacing: 10) {
                                Text("**\(eval.percentage)%**: \(eval.comment)")
                            }
                        } else {
                            if (eval.comment != " ") && (eval.percentage == 0) {
                                Text("Note: ")
                                    .bold()
                            } else if (eval.comment == " ") && (eval.percentage == 0) {
                                Text("")
                            }
                            VStack(spacing: 5) {
                                Text("\(eval.comment)")
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .horizontal])
        }
        .padding()
    }
}
