//
//  TrackingPreferenceView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import SwiftUI

struct TrackingPreferenceView: View {
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager

    
    @AppStorage("isSocial") private var isSocial = false
    @AppStorage("exercisesRegularly") private var exercisesRegularly = false
    @AppStorage("experiencesStress") private var experiencesStress = false
    @AppStorage("experiencesAnxiety") private var experiencesAnxiety = false

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Are you typically social?", isOn: $isSocial)
                Toggle("Do you exercise on a regular basis?", isOn: $exercisesRegularly)
                Toggle("Do you experience stress?", isOn: $experiencesStress)
                Toggle("Do you experience anxiety?", isOn: $experiencesAnxiety)

                NavigationLink(destination: HomeScreenView().environmentObject(sessionManager).environmentObject(userPreferences)) {
                    Text("Next")
                }
                .onTapGesture {
                    userPreferences.socialInteraction = isSocial
                    userPreferences.exercise = exercisesRegularly
                    userPreferences.stress = experiencesStress
                    userPreferences.anxiety = experiencesAnxiety
                }
            }
            .padding()
        }
    }
}

struct TrackingPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingPreferenceView()
            .environmentObject(UserPreferences())
            .environmentObject(RantSessionManager())
    }
}
