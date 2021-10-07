//
//  SyllabusDataService.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import Foundation
import Combine

class SyllabusDataService {
    
    @Published var allSyllabus: [Syllabus] = []
    
    var syllabusSubscription: AnyCancellable?
    
    init() {
        getSyllabus()
    }
    
    func getSyllabus() {
        guard let url = URL(string: "https://api.wasedatime.com/staging/syllabus/SILS") else { return }
        syllabusSubscription = NetworkingManager.download(url: url)
            .decode(type: [Syllabus].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedSyllabus) in
                self?.allSyllabus = returnedSyllabus
                self?.syllabusSubscription?.cancel()
            })
    }
    
}
