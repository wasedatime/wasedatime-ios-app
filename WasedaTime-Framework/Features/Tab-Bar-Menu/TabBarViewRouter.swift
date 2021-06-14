//
//  TabBarViewRouter.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

class TabBarViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case timetable
    case syllabus
    case user
}
