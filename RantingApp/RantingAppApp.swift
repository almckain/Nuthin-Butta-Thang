//
//  RantingAppApp.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

@main
struct RantingAppApp: App {
    
    @StateObject private var sessionManager = RantSessionManager()
    @StateObject private var userPreferences = UserPreferences()

    
    var body: some Scene {
        WindowGroup {
            TrackingPreferenceView()
                .environmentObject(sessionManager)
                .environmentObject(userPreferences)
                
        }
    }
}
