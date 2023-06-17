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

    @AppStorage("isSocial") private var isSocial = false {
        didSet {
            userPreferences.socialInteraction = isSocial
        }
    }
    @AppStorage("exercisesRegularly") private var exercisesRegularly = false {
        didSet {
            userPreferences.exercise = exercisesRegularly
        }
    }
    @AppStorage("experiencesStress") private var experiencesStress = false {
        didSet {
            userPreferences.stress = experiencesStress
        }
    }
    @AppStorage("experiencesAnxiety") private var experiencesAnxiety = false {
        didSet {
            userPreferences.anxiety = experiencesAnxiety
        }
    }
    @AppStorage("experiencesDepression") private var experiencesDepression = false {
        didSet {
            userPreferences.depression = experiencesDepression
        }
    }

    var body: some View {
        ZStack{
            VStack {
                VStack{
                    /**
                     
                        WHENEVER EDITING TEXT, CHANGE BACKGROUND COLOR FROM WHITE TO BLUE (or whatever, you want) SWITCH BACK TO WHITE AFTERWARDS THOUGH
                     
                     */
                    HStack{
                        Text("Please select all that apply")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.leading, 20)

                        Spacer()
                    }
                    HStack{
                        Text("(Can be changed later)")
                            .fontWeight(.light)
                            .padding(.leading, 20)

                        Spacer()
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.15)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
                .foregroundColor(Color.white)

                
                VStack{
                    Toggle("Are you typically social?", isOn: $isSocial)
                        .padding(.bottom, 15)
                        .onChange(of: isSocial) { value in
                            userPreferences.socialInteraction = value
                        }
                    
                    Toggle("Do you exercise on a regular basis?", isOn: $exercisesRegularly)
                        .padding(.bottom, 15)
                        .onChange(of: exercisesRegularly) { value in
                            userPreferences.exercise = value
                        }
                    
                    Toggle("Do you experience stress?", isOn: $experiencesStress)
                        .padding(.bottom, 15)
                        .onChange(of: experiencesStress) { value in
                            userPreferences.stress = value
                        }
                    
                    Toggle("Do you experience anxiety?", isOn: $experiencesAnxiety)
                        .padding(.bottom, 15)
                        .onChange(of: experiencesAnxiety) { value in
                            userPreferences.anxiety = value
                        }
                    
                    Toggle("Do you experience depression?", isOn: $experiencesDepression)
                        .padding(.bottom, 15)
                        .onChange(of: experiencesDepression){ value in
                            userPreferences.depression = value
                        }
                }
                .padding(.leading)
                .padding(.trailing, 14.0)
                .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.35)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
                .cornerRadius(12)
                .foregroundColor(Color.white)

                Spacer()
            }
            .padding(27.0)
            .onAppear {
                userPreferences.socialInteraction = isSocial
                userPreferences.exercise = exercisesRegularly
                userPreferences.stress = experiencesStress
                userPreferences.anxiety = experiencesAnxiety
                userPreferences.depression = experiencesDepression
            }
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
