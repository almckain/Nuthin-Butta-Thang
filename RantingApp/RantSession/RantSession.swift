//
//  RantSession.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation
import SwiftUI

struct RantSession: Identifiable{
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
}
