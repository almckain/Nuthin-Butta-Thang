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
    var title: String
    var date: Date

    
    init(id: String = UUID().uuidString, text: String, emoji: String, title: String, date: Date) {
        self.id = id
        self.text = text
        self.emoji = emoji
        self.date = date
        self.title = title
    }
    
    //Im not typing anyhitng
    
    static var sampleEntries:[JournalEntry]{
        return [
            JournalEntry(text: "Im unhappy because im life sucks and im lonely", emoji: "🤬", title: "I do be mad lonely", date: Date().diff(numDays: 0)),
            JournalEntry(text: "Sometime when i go poop i keep wiping and wiping and it seems like its never going to end.", emoji: "🙃", title: "I have to keep wiping", date: Date().diff(numDays: -1)),
            JournalEntry(text: "Recently i tried porting this app to android and it really pissed me off. Like just use Apple omggg", emoji: "🤬", title: "Developing for android is not chill", date: Date().diff(numDays: 6)),
            JournalEntry(text: "Im preparing for my coding interviews and its pretty daughnting (dont think i spelt that right).", emoji: "😬", title: "Preparing for coding interviews is not chill", date: Date().diff(numDays: 2)),
            JournalEntry(text: "Its a little stressing to think that i might not graduate in four years. Getting two degrees is tough.", emoji: "😓", title: "Im stressed", date: Date().diff(numDays: -3)),
            JournalEntry(text: "Dating is hard in college. Not sure if people want to date for the future or if they want to date for fun. Its annoying and immature.", emoji: "🙄", title: "Life sucks then you die", date: Date().diff(numDays: -4))
        ]
    }
}
