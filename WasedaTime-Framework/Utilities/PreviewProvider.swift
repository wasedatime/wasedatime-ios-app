//
//  PreviewProvider.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = SyllabusViewModel()
    
    let syllabus = Syllabus(
        id: "210EX50100552021210EX5010021",
        titleEN: "Seminar on Expression  55",
        titleJP: "Seminar on Expression  55",
        nameEN: "SAKAKIBARA, Richi",
        nameJP: "榊原 理智",
        languages: [0,1],
        type: 1,
        term: "2s",
        occurrences: [I(day: 3, period: 5, location: "11-811")],
        minYear: 3,
        categoryEN: "Advanced Seminar",
        credit: 2,
        level: 2,
        evaluations: [],
        code: "LITJ364S",
        subtitle: "Advanced Seminar in Literary Studies",
        categoryJP: "上級演習"
    )
    
}

