//
//  PhotoTrial.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 10/6/21.
//

import Foundation
import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map { Photo(name: "coffee-\($0)") }
