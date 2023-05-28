//
//  RantingAppApp.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

@main
struct RantAppApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @StateObject var sessionManager = RantSessionManager()
    @StateObject var userPreferences = UserPreferences()
    
    init() {
            print("isFirstLaunch: \(isFirstLaunch)")
        }
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingView(isFirstLaunch: $isFirstLaunch)
                    .environmentObject(sessionManager)
                    .environmentObject(userPreferences)
                    .onAppear{
                        print("Showing OnboardingView")
                    }
            } else {
                HomeScreenView()
                    .environmentObject(sessionManager)
                    .environmentObject(userPreferences)
                    .onAppear{
                        print("Showing HomeScreenView")

                    }
            }
        }
    }
}
