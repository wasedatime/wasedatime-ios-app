//
//  SyllabusViewModel.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import Foundation
import Combine

class SyllabusViewModel: ObservableObject {
    
    @Published var allSyllabus: [Syllabus] = []
    @Published var searchText: String = ""
    
    private let syllabusDataService = SyllabusDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // Updates allCoins
        $searchText
            .combineLatest(syllabusDataService.$allSyllabus)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortSyllabus)
            .sink { [weak self] (returnedSyllabus) in
                self?.allSyllabus = returnedSyllabus
            }
            .store(in: &cancellables)
        
        //
        syllabusDataService.$allSyllabus
            .sink { [weak self] returnedSyllabus in
                self?.allSyllabus = returnedSyllabus
            }
            .store(in: &cancellables)
    }
    
    private func filterAndSortSyllabus(text: String, syllabus: [Syllabus]) -> [Syllabus] {
        let updatedSyllabus = filterSyllabus(text: text, syllabus: syllabus)
        return updatedSyllabus
    }

    private func filterSyllabus(text: String, syllabus: [Syllabus]) -> [Syllabus] {
        guard !text.isEmpty else {
            return syllabus
        }
        let lowercasedText = text.lowercased()
        return syllabus.filter { (syllabi) -> Bool in
            return syllabi.titleEN.lowercased().contains(lowercasedText) ||
            syllabi.titleJP.lowercased().contains(lowercasedText) ||
            syllabi.nameEN.lowercased().contains(lowercasedText) ||
            syllabi.nameJP.lowercased().contains(lowercasedText) ||
            syllabi.categoryEN.lowercased().contains(lowercasedText) ||
            syllabi.subtitle.lowercased().contains(lowercasedText) ||
            syllabi.categoryJP.lowercased().contains(lowercasedText)
        }
    }
}
