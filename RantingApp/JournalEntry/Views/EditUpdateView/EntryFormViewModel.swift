//
//  EntryFormViewModel.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import Foundation

class EntryFormViewModel: ObservableObject{
    @Published var date = Date()
    @Published var text = ""
    @Published var emoji = ""
    @Published var socialInteraction = false
    @Published var exercise = false
    @Published var stressLevel = 0
    @Published var productivityLevel = 0
    @Published var anxietyLevel = 0
    @Published var depressionLevel = 0
    
    var id: String?
    var updating: Bool { id != nil }
    
    init(){}
    
    init(_ entry: JournalEntry){
        date = entry.date
        text = entry.text
        emoji = entry.emoji
        socialInteraction = entry.socialInteraction
        exercise = entry.exercise
        stressLevel = entry.stressLevel
        productivityLevel = entry.productivityLevel
        anxietyLevel = entry.anxietyLevel
        depressionLevel = entry.depressionLevel
    }
    
    var incomplete: Bool{
        text.isEmpty
    }
}
