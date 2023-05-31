//
//  MeetTheDevView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome To...")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .padding(.top, 20)
            HStack{
                Text("Nothin' Butta \nThang")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .bottom], 15.0)
                    .padding(.leading, 35)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.15)
            .background(Color.white.opacity(0.2))
            .cornerRadius(20)
            
            VStack{
                Text("Enter a rant session whenever you feel upset!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Text("Read some articles on mental health!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)

                Text("Set a couple self care reminders!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                Text("Review a personalized weekly report generated by AI!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)

            }
            .foregroundColor(Color.white)
            .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.4)
            .background(Color.white.opacity(0.2))
            .cornerRadius(20)
            //this is a comment
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
