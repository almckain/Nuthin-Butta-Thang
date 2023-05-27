//
//  TrackingPreferenceView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import SwiftUI

struct TrackingPreferenceView: View {
    @AppStorage("isSocial") private var isSocial = false
        @AppStorage("exercisesRegularly") private var exercisesRegularly = false
        @AppStorage("experiencesStress") private var experiencesStress = false
        @AppStorage("experiencesAnxiety") private var experiencesAnxiety = false

        var body: some View {
            VStack {
                Toggle("Are you typically social?", isOn: $isSocial)
                Toggle("Do you exercise on a regular basis?", isOn: $exercisesRegularly)
                Toggle("Do you experience stress?", isOn: $experiencesStress)
                Toggle("Do you experience anxiety?", isOn: $experiencesAnxiety)
            }
            .padding()
        }
}

struct TrackingPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingPreferenceView()
    }
}
