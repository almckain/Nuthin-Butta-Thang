//
//  RantSessionManager.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation

class RantSessionManager: ObservableObject{
    @Published var sessions: [RantSession] = []
    func addSession(withText text: String, withEmoji emoji: String, withDate date: String){
        
        let newSession = RantSession(text: text, emoji: emoji, date: date)
        
        sessions.append(newSession)
    }
}
