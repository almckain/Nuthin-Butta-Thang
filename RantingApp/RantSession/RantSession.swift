//
//  RantSession.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation
import SwiftUI

struct RantSession: Identifiable{
    let id = UUID()
    let text: String
    let emoji: String
    let date: Date
    let socialInteraction: Bool
    let exercise: Bool
    let stressLevel: Int
    let productivityLevel: Int
    let anxietyLevel: Int
    let depressionLevel: Int
}
