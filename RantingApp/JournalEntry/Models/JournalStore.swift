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
    @Published var streak: Int = 0// New property for streak
    
    init(preview: Bool = false){
        self.preview = preview
        self.streak = streak
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
            updateStreak()
        }
    }
    
    func add(_ entry: JournalEntry){
        journalEntries.append(entry)
        updateStreak()
    }
    
    func update(_ entry: JournalEntry){
        if let index = journalEntries.firstIndex(where: {$0.id == entry.id}){
            journalEntries[index].date = entry.date
            journalEntries[index].text = entry.text
            journalEntries[index].emoji = entry.emoji
            journalEntries[index].title = entry.title
            updateStreak()
        }
    }
    
    func updateStreak() {
        let sortedEntries = journalEntries.sorted(by: { $0.date > $1.date })

        var currentStreak = 1
        let currentDate = Date()

        let calendar = Calendar.current

        var latestEntryDateProcessed: Date?

        for entry in sortedEntries {
            let entryDay = calendar.startOfDay(for: entry.date)
            let currentDay = calendar.startOfDay(for: currentDate)

            print("Entry Date: \(entry.date)")
            print("Entry Day: \(entryDay)")
            print("Current Day: \(currentDay)")

            if latestEntryDateProcessed == nil || calendar.isDate(entryDay, inSameDayAs: latestEntryDateProcessed!) {
                // if this is the first entry being processed or if this entry's date is the same as the latest entry date processed,
                // then just update the latestEntryDateProcessed and continue with the next entry
                latestEntryDateProcessed = entryDay
                continue
            } else if calendar.isDate(entryDay, equalTo: calendar.date(byAdding: .day, value: -1, to: latestEntryDateProcessed!)!, toGranularity: .day) {
                // if this entry's date is the day after the latest entry date processed, increment the streak and update the latest entry date processed
                currentStreak += 1
                latestEntryDateProcessed = entryDay
            } else {
                // if this entry's date is not the same as or the day after the latest entry date processed, then the streak is broken
                break
            }
        }

        streak = currentStreak
        print("Streak: \(currentStreak)")
    }




}
