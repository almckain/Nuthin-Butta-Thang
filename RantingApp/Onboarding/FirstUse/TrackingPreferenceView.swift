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
    @AppStorage("experiencesDepression") private var experiencesDepression = false

    var body: some View {
        ZStack{
            VStack {
                VStack{
                    HStack{
                        Text("Please select all that apply")
                            .font(.title)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    HStack{
                        Text("(Can be changed later)")
                            .fontWeight(.light)
                        Spacer()
                    }
                }
                .padding(.bottom, 20.0)
                VStack{
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
                    
                    Toggle("Do you experience depression?", isOn: $experiencesDepression)
                        .onChange(of: experiencesDepression){ value in
                            userPreferences.depression = value
                        }
                }
                .padding(.trailing, 14.0)
                //.frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.5)
                //.background(Color.blue)
                .cornerRadius(12)
                Spacer()
            }
            .padding(27.0)
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
