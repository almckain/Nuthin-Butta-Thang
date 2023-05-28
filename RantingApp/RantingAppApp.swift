//
//  RantingAppApp.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

@main
struct RantAppApp: App {
    @StateObject var sessionManager = RantSessionManager()
    @StateObject var userPreferences = UserPreferences()
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(sessionManager)
                .environmentObject(userPreferences)
                    
        }
    }
}
