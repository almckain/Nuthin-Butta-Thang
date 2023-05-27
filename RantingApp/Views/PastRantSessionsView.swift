//
//  ContentView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI

struct PastRantSessionsView: View {
    
    @EnvironmentObject var sessionManager: RantSessionManager
    
    var body: some View{
        NavigationView{
            ZStack{
                //Changes background color
                Color(red: 230/255, green: 230/255, blue: 250/255)
                    .ignoresSafeArea()
                VStack{
                    //Title Text
                    HStack{
                        Text("Rant Sessions")
                            .font(.system(size: 36, weight: .bold))
                            .padding(.top, 20)
                            .padding(.leading, 15)
                        Spacer()
                    }
                    //New Rant Session Button
                    Divider()
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
                    Divider()
                    ScrollView{
                        VStack{
                            generateSessionCards()

                        }
                    }
                     
                    Spacer()
                }
            }
        }
    }
    func generateSessionCards() -> some View{
        ForEach(sessionManager.sessions) { session in
            NavigationLink(destination: SessionDetailView(session: session)){
                SessionCard(session: session)
            }
        }
    }
}

struct PastRantSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        PastRantSessionsView()
            .environmentObject(RantSessionManager())
            .environmentObject(UserPreferences())
    }
}
