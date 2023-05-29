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
                shouldShowOnBoarding: $shouldShowOnboarding
            )
            PageView(
                currentView: AnyView(ColorThemeView()),
                shouldShowOnBoarding: $shouldShowOnboarding
            )
            PageView(
                currentView: AnyView(UserAgreement(shouldShowOnBoarding: $shouldShowOnboarding)),
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
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

    }
}

/*
 struct OnboardingView_Previews: PreviewProvider {
 static var previews: some View {
 OnboardingView()
 }
 }
 */
