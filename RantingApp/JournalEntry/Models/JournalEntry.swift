//
//  JournalEntry.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//
//  Inspired from @Stewart Lynch
//  Youtube: https://youTube.com/StewartLynch

import Foundation

struct JournalEntry: Identifiable{
    var id: String
    var text: String
    var emoji: String
    var date: Date
    var socialInteraction: Bool
    var exercise: Bool
    var stressLevel: Int
    var productivityLevel: Int
    var anxietyLevel: Int
    var depressionLevel: Int
    
    init(id: String = UUID().uuidString, text: String, emoji: String, date: Date, socialInteraction: Bool, exercise: Bool, stressLevel: Int, productivityLevel: Int, anxietyLevel: Int, depressionLevel: Int) {
        self.id = id
        self.text = text
        self.emoji = emoji
        self.date = date
        self.socialInteraction = socialInteraction
        self.exercise = exercise
        self.stressLevel = stressLevel
        self.productivityLevel = productivityLevel
        self.anxietyLevel = anxietyLevel
        self.depressionLevel = depressionLevel
    }
    
    static var sampleEntries:[JournalEntry]{
        return [
            JournalEntry(text: "Im unhappy because im life sucks and im lonely", emoji: "🤬", date: Date().diff(numDays: 0), socialInteraction: true, exercise: false, stressLevel: 3, productivityLevel: 2, anxietyLevel: 3, depressionLevel: 2),
            JournalEntry(text: "Sometime when i go poop i keep wiping and wiping and it seems like its never going to end.", emoji: "🙃", date: Date().diff(numDays: -1), socialInteraction: false, exercise: true, stressLevel: 5, productivityLevel: 2, anxietyLevel: 5, depressionLevel: 1),
            JournalEntry(text: "Recently i tried porting this app to android and it really pissed me off. Like just use Apple omggg", emoji: "🤬", date: Date().diff(numDays: 6), socialInteraction: true, exercise: true, stressLevel: 1, productivityLevel: 4, anxietyLevel: 4, depressionLevel: 4),
            JournalEntry(text: "Im preparing for my coding interviews and its pretty daughnting (dont think i spelt that right).", emoji: "😬", date: Date().diff(numDays: 2), socialInteraction: false, exercise: false, stressLevel: 3, productivityLevel: 2, anxietyLevel: 5, depressionLevel: 5),
            JournalEntry(text: "Its a little stressing to think that i might not graduate in four years. Getting two degrees is tough.", emoji: "😓", date: Date().diff(numDays: -3), socialInteraction: false, exercise: true, stressLevel: 2, productivityLevel: 4, anxietyLevel: 1, depressionLevel: 1),
            JournalEntry(text: "Dating is hard in college. Not sure if people want to date for the future or if they want to date for fun. Its annoying and immature.", emoji: "🙄", date: Date().diff(numDays: -4), socialInteraction: true, exercise: false, stressLevel: 4, productivityLevel: 1, anxietyLevel: 2, depressionLevel: 2)
        ]
    }
}
