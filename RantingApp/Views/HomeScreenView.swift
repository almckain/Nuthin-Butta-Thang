//
//  HomeScreenView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnboarding: Bool = true
    @State private var affirmation: String = ""
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager
    
    //For testing regarding the onboarding
    init(){
        shouldShowOnboarding = true
    }
    var body: some View {
        NavigationView{
            ZStack{
                //Changes background color
                LinearGradient(
                            gradient: Gradient(colors: [Color(red: 230/255, green: 230/255, blue: 250/255), Color.white]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                VStack{
                    //Title Text
                    HStack{
                        Text("Nuthin' Butta\nThang")
                            .font(.system(size: 36, weight: .bold))
                            .padding(.top, 20)
                            .padding(.leading, 15)
                        Spacer()
                    }
                    //New Rant Session Button
                    Divider()
                    ScrollView{
                        HStack{
                            Spacer()
                            Text(affirmation.isEmpty ? "Fetching affirmation..." : "\"\(affirmation)\"")
                                .italic()
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        Divider()
                        
                        VStack{
                            HStack{
                                Text("Recommended Articles")
                                    .padding(.leading, 15.0)
                                Spacer()
                            }
                            HStack{
                                ArticleCard()
                                ArticleCard()
                                ArticleCard()
                                
                                
                            }
                        }
                        Divider()
                        //Calendar thing goes here
                        Text("Calender")
                            .padding()
                        Divider()
                        VStack{
                            HStack{
                                Text("Recent Rants")
                                Spacer()
                                NavigationLink(destination: PastRantSessionsView().environmentObject(sessionManager).environmentObject(userPreferences)) {
                                    Text("All Rants")
                                }
                            }
                            .padding()
                        }
                        /*
                        NavigationLink(destination: MoodCalendarView()) {
                            Text("Rant Calendar")
                                .font(.title2)
                                .padding()
                        }
                         */
                    }
                     
                    Spacer()
                }
            }
            .onAppear {
                fetchAffirmation()
            }
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
    
    
    func fetchAffirmation() {
        AffirmationAPI().fetchAffirmation { fetchedAffirmation in
            if fetchedAffirmation.isEmpty {
                affirmation = BackupAffirmation().getBackupAffirmation()
            } else {
                affirmation = fetchedAffirmation
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(RantSessionManager())
            .environmentObject(UserPreferences())
    }
}
