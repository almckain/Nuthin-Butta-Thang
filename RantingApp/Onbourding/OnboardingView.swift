//
//  OnboardingView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/27/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunch: Bool
    
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager
    
    var body: some View {
        TabView {
            TrackingPreferenceView()
                .tag(1)
            ColorThemeView(isFirstLaunch: $isFirstLaunch)
                .tag(2)
            // Add more onboarding views here as needed
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onAppear(perform: {
            print("OnboardingView appeared")

            isFirstLaunch = false
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    @State static var isFirstLaunch = true

    static var previews: some View {
        OnboardingView(isFirstLaunch: $isFirstLaunch)
            .environmentObject(UserPreferences())
            .environmentObject(RantSessionManager())
    }
}
