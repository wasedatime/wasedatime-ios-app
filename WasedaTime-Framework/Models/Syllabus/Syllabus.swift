//
//  Syllabus.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import Foundation

// MARK: - SYLLABUS
struct Syllabus: Identifiable, Codable, Hashable {
    let id, titleEN, titleJP, nameEN, nameJP: String
    let languages: [Int]
    let type: Int
    let term: String
    let occurrences: [I]
    let minYear: Int
    let categoryEN: String
    let credit, level: Int
    let evaluations: [N]
    let code, subtitle, categoryJP: String
    
    enum CodingKeys: String, CodingKey {
        case id = "a"
        case titleEN = "b"
        case titleJP = "c"
        case nameEN = "d"
        case nameJP = "e"
        case languages = "f"
        case type = "g"
        case term = "h"
        case occurrences = "i"
        case minYear = "j"
        case categoryEN = "k"
        case credit = "l"
        case level = "m"
        case evaluations = "n"
        case code = "o"
        case subtitle = "p"
        case categoryJP = "q"
    }
}

// MARK: - OCCURRENCES
struct I: Codable, Hashable {
    let day, period: Int
    let location: String
    
    enum CodingKeys: String, CodingKey {
        case day = "d"
        case period = "p"
        case location = "l"
    }
}

// MARK: - EVALUATIONS
struct N: Codable, Hashable {
    let percentage: Int
    let comment: String
    let type: Int
    
    enum CodingKeys: String, CodingKey {
        case percentage = "p"
        case comment = "c"
        case type = "t"
    }
}
