//
//  UserAgreement.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct UserAgreement: View {
    @State private var isDisclaimerAccepted = false
    
    @Binding var shouldShowOnBoarding: Bool
    
    let defaults = UserDefaults.standard

    var body: some View {
        VStack {
            ScrollView {
                Text("Disclaimer: Please note that the app is not intended to replace or substitute the services provided by licensed mental health professionals. The information, resources, and features offered within the app are designed for educational and informational purposes only. While we strive to provide accurate and up-to-date content, it should not be considered a substitute for professional advice, diagnosis, or treatment. \n\nThe app does not endorse or guarantee the effectiveness, suitability, or safety of any recommendations, techniques, or strategies provided. Every individual's mental health journey is unique, and it is crucial to consult with a qualified professional for personalized guidance and support. The app is not responsible for any adverse consequences or harm resulting from the use of the app or reliance on the information provided. \n\nIt is important to prioritize your well-being and seek appropriate help from healthcare professionals if you are experiencing significant distress, mental health conditions, or are in crisis. If you or someone you know is in immediate danger or experiencing a medical emergency, please call emergency services or go to the nearest emergency room. \n\nBy checking the box below, you acknowledge and agree that you have read and understood the disclaimer. You further acknowledge that the app's content and features are not a substitute for professional mental health care. The app is not liable for any actions, decisions, or outcomes resulting from the use of the app. It is always recommended to consult with qualified professionals to address your specific needs and circumstances.")
            }
            .frame(width: 300, height: 500)
            .padding()
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 4)
            )

            

            Toggle(isOn: $isDisclaimerAccepted) {
                Text("I have read and agree to the above disclaimer.")
            }
            .padding(.top, 20)
            .padding(.horizontal, 30)

            Button(action: {
                shouldShowOnBoarding.toggle()
                // action when the button is tapped
                if self.isDisclaimerAccepted {
                    self.defaults.set(true, forKey: "isDisclaimerAccepted")
                    self.defaults.set(Date(), forKey: "disclaimerAcceptedDate")
                }
            }) {
                Text("Continue")
            }
            .disabled(!isDisclaimerAccepted)  // disable the button if the disclaimer is not accepted
            .padding(.top, 20)
            .padding(.bottom, 50)
            
        }
    }
}
/*
struct UserAgreement_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreement()
    }
}
*/
