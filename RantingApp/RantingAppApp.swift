//
//  RantingAppApp.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

@main
struct RantAppApp: App {
    @StateObject var userPreferences = UserPreferences()
    @StateObject var myEntries = JournalStore(preview: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userPreferences)

                    
        }
    }
}
