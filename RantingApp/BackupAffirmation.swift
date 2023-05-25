//
//  BackupAffirmation.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import Foundation

class BackupAffirmation {
    func getBackupAffirmation() -> String {
        if let url = Bundle.main.url(forResource: "BackupAffirmations", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let affirmations = try? JSONDecoder().decode([String].self, from: data),
           let affirmation = affirmations.randomElement() {
            return affirmation
        } else {
            print("Error getting backup affirmation")
            return ""
        }
    }
}
