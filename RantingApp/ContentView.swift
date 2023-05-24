//
//  ContentView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var sessionManager: RantSessionManager
    
    var body: some View{
        NavigationView{
            ZStack{
                //Changes background color
                Color(red: 230/255, green: 230/255, blue: 250/255)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Nuthin' Butta \nThang")
                            .font(.system(size: 36, weight: .bold))
                            .padding(.top, 20)
                            .padding(.leading, 15)
                        Spacer()
                    }
                    //Added a comment
                    HStack{
                        Spacer()
                        NavigationLink(destination: RantSessionView()){
                            Text("New Rant Session")
                                .font(.body)
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        Spacer()
                    }
                    
                    ForEach(sessionManager.sessions) { session in
                        HStack{
                            Text("😎")
                                .font(.system(size: 56))
                            VStack(alignment: .leading){
                                Text(getRantPreview(for: session.text))
                                    .font(.body)
                                Text("Created: May 23 2023")
                            }
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.10)
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                     
                    Spacer()
                }
            }
        }
    }
    func getRantPreview(for text: String) -> String {
        if text.count > 25 {
            return String(text.prefix(22)) + "..."
        } else {
            return text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RantSessionManager())
    }
}
