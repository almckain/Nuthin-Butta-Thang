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

    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(sessionManager)
                
        }
    }
}
