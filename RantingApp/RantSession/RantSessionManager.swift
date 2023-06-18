//
//  RantSessionManager.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation

class RantSessionManager: ObservableObject {
    @Published var sessions: [RantSession] = []
    @Published var userPreferences = UserPreferences()

    init() {
        // Add some default sessions
        let defaultSession1 = RantSession(
            text: "Default text 1",
            emoji: "😀",
            date: Date(),
            socialInteraction: true,
            exercise: false,
            stressLevel: 3,
            productivityLevel: 2,
            anxietyLevel: 1,
            depressionLevel: 0
        )
        let defaultSession2 = RantSession(
            text: "Default text 2",
            emoji: "😀",
            date: Date(),
            socialInteraction: false,
            exercise: true,
            stressLevel: 2,
            productivityLevel: 3,
            anxietyLevel: 2,
            depressionLevel: 1
        )
        
        sessions.append(contentsOf: [defaultSession1, defaultSession2])
    }
    
    func delete(_ session: RantSession){
        if let index = sessions.firstIndex(where: {$0.id == session.id}){
            sessions.remove(at: index)
        }
    }
    
    func add(_ session: RantSession){
        sessions.append(session)
    }
    
    func update(_ session: RantSession){
        if let index = sessions.firstIndex(where: {$0.id == session.id}){
            sessions[index].text = session.text
            sessions[index].emoji = session.emoji
            sessions[index].date = session.date
            sessions[index].socialInteraction = session.socialInteraction
            sessions[index].exercise = session.exercise
            sessions[index].stressLevel = session.stressLevel
            sessions[index].productivityLevel = session.productivityLevel
            sessions[index].anxietyLevel = session.anxietyLevel
            sessions[index].depressionLevel = session.depressionLevel
        }
    }
    
    /*
    func addSession(
        withText text: String,
        withEmoji emoji: String,
        withDate date: String,
        withSocialInteraction socialInteration: Bool,
        withExercise exercise: Bool,
        withStressLevel stressLevel: Int,
        withProductivityLevel productivityLevel: Int,
        withAnxietyLevel anxietyLevel: Int,
        withDepressionLevel depressionLevel: Int
    ) {
        let newSession = RantSession(
            text: text,
            emoji: emoji,
            date: Date(),
            socialInteraction: socialInteration,
            exercise: exercise,
            stressLevel: stressLevel,
            productivityLevel: productivityLevel,
            anxietyLevel: anxietyLevel,
            depressionLevel: depressionLevel
        )

        sessions.append(newSession)
    }
     */
}
