//
//  JournalStore.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//
//  Inspired from @Stewart Lynch
//  Youtube: https://youTube.com/StewartLynch

import Foundation

@MainActor
class JournalStore: ObservableObject{
    @Published var journalEntries = [JournalEntry]()
    @Published var preview: Bool
    
    init(preview: Bool = false){
        self.preview = preview
        fetchEntries()
    }
    
    func fetchEntries(){
        if preview{
            journalEntries = JournalEntry.sampleEntries
        }else{
            //load from persistence store...not sure what that means
        }
    }
    
    func delete(_ entry: JournalEntry){
        if let index = journalEntries.firstIndex(where: {$0.id == entry.id}){
            journalEntries.remove(at: index)
        }
    }
    
    func add(_ entry: JournalEntry){
        journalEntries.append(entry)
    }
    
    func update(_ entry: JournalEntry){
        if let index = journalEntries.firstIndex(where: {$0.id == entry.id}){
            journalEntries[index].date = entry.date
            journalEntries[index].text = entry.text
            journalEntries[index].emoji = entry.emoji
            journalEntries[index].socialInteraction = entry.socialInteraction
            journalEntries[index].exercise = entry.exercise
            journalEntries[index].stressLevel = entry.stressLevel
            journalEntries[index].productivityLevel = entry.productivityLevel
            journalEntries[index].anxietyLevel = entry.anxietyLevel
            journalEntries[index].depressionLevel = entry.depressionLevel
        }
    }
}
