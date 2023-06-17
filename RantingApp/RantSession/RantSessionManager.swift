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
}
