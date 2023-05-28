//
//  UserPreference.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import Foundation

class UserPreferences: ObservableObject {
    @Published var socialInteraction: Bool = false
    @Published var exercise: Bool = false
    @Published var stress: Bool = false
    @Published var anxiety: Bool = false
}

