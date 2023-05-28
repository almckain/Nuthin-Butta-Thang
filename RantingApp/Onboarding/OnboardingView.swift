//
//  OnboardingView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            TrackingPreferenceView()
                .tag(0)
            ColorThemeView()
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
