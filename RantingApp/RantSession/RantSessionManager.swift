//
//  RantSessionManager.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation

class RantSessionManager: ObservableObject{
    @Published var sessions: [RantSession] = []
    @Published var userPreferences = UserPreferences()

    
    func addSession(withText text: String, withEmoji emoji: String, withDate date: String, withSocialInteraction socialInteration: Bool, withExercise exercise: Bool, withStressLevel stressLevel: Int, withProductivityLevel productivityLevel: Int, withAnxietyLevel anxietyLevel: Int){
        
        let newSession = RantSession(text: text, emoji: emoji, date: date, socialInteraction: socialInteration, exercise: exercise, stressLevel: stressLevel, productivityLevel: productivityLevel, anxietyLevel: anxietyLevel)
        
        //Add Depression level as an option
        
        sessions.append(newSession)
    }
}
