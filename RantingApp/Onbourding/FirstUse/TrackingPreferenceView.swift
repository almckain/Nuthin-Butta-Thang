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

    @State private var navigateToHomeScreen = false

    @AppStorage("isSocial") private var isSocial = false
    @AppStorage("exercisesRegularly") private var exercisesRegularly = false
    @AppStorage("experiencesStress") private var experiencesStress = false
    @AppStorage("experiencesAnxiety") private var experiencesAnxiety = false

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Are you typically social?", isOn: $isSocial)
                    .onChange(of: isSocial) { value in
                        userPreferences.socialInteraction = value
                    }
                
                Toggle("Do you exercise on a regular basis?", isOn: $exercisesRegularly)
                    .onChange(of: exercisesRegularly) { value in
                        userPreferences.exercise = value
                    }
                
                Toggle("Do you experience stress?", isOn: $experiencesStress)
                    .onChange(of: experiencesStress) { value in
                        userPreferences.stress = value
                    }
                
                Toggle("Do you experience anxiety?", isOn: $experiencesAnxiety)
                    .onChange(of: experiencesAnxiety) { value in
                        userPreferences.anxiety = value
                    }

                NavigationLink(destination: HomeScreenView().environmentObject(sessionManager).environmentObject(userPreferences)) {
                    Text("Next")
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
