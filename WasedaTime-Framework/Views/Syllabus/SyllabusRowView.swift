//
//  SyllabusRowView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SyllabusRowView: View {
    let syllabus: Syllabus
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            topContent
            bottomContent
        }
        .foregroundColor(.theme.white2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.theme.white2, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .shadow(color: .white.opacity(0.7), radius: 5, x: 0, y: 0)
        )
    }
    
    // MARK: - FUNCTIONS
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
}

struct SyllabusRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Glassmorphism()
            SyllabusRowView(syllabus: dev.syllabus)
        }
    }
}

extension SyllabusRowView {
    private var topContent: some View {
        HStack(spacing: 10) {
            
            Image("SILS")
            
            Text(syllabus.titleEN)
                .lineLimit(1)
            
            Spacer()
            
            Text(syllabusLanguages())
        }
    }
    
    private var middleContent: some View {
        VStack(spacing: 4) {
            ForEach(syllabus.occurrences, id: \.self) { occur in
                if syllabus.occurrences.isEmpty {
                    Text("")
                }
                HStack(spacing: 16) {
                    HStack {
                        Image(systemName: "clock")
                        switch occur.day {
                        case -1:
                            Text("Oth")
                        case 0:
                            Text("Mon")
                        case 1:
                            Text("Tue")
                        case 2:
                            Text("Wed")
                        case 3:
                            Text("Thu")
                        case 4:
                            Text("Fri")
                        case 5:
                            Text("Sat")
                        default:
                            Text("Sun")
                        }
                        Text(".\(occur.period)")
                    }
                    HStack {
                        Image(systemName: "mappin")
                        Text("\(occur.location)")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var bottomContent: some View {
        HStack {
            Image(systemName: "person.fill")
            Text(syllabus.nameEN)
                .frame(width: 250, alignment: .leading)
                .lineLimit(1)
        }
        .padding(.horizontal, 10)
    }
}

