//
//  OnboardingView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        TabView{
            PageView(
                currentView: AnyView(TrackingPreferenceView()),
                lastPage: false,
                shouldShowOnBoarding: $shouldShowOnboarding
            )
            PageView(
                currentView: AnyView(ColorThemeView()),
                lastPage: false,
                shouldShowOnBoarding: $shouldShowOnboarding
            )
            PageView(
                currentView: AnyView(UserAgreement()),
                lastPage: true,
                shouldShowOnBoarding: $shouldShowOnboarding
            )
            /*
            TrackingPreferenceView()
                .tag(0)
            ColorThemeView()
                .tag(1)
             */
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

/*
 struct OnboardingView_Previews: PreviewProvider {
 static var previews: some View {
 OnboardingView()
 }
 }
 */
