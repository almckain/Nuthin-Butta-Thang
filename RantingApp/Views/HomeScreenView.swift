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
    @EnvironmentObject var myEntries: JournalStore


    //For testing regarding the onboarding
    /*
    init(){
        shouldShowOnboarding = true
    }
    */
    
     
    var body: some View {
        
        NavigationView{
            ZStack{
                //Changes background color
                
                LinearGradient(
                    gradient: Gradient(colors: [userPreferences.secondaryColor, userPreferences.middleColor, userPreferences.primaryColor]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack{
                    //Title Text
                    HStack{
                        Text("Nuthin' Butta\nThang")
                            .font(.system(size: 36, weight: .bold))
                            .padding(.top, 10)
                            .padding(.leading, 15)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    
                    ScrollView{
                        //Affirmation
                        HStack{
                            Spacer()
                            Text(affirmation.isEmpty ? "Fetching affirmation..." : "\"\(affirmation)\"")
                                .italic()
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .foregroundColor(Color.white)

                            Spacer()
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                        
                        //Recommended Articles
                        VStack{
                            HStack{
                                Text("Recommended Articles")
                                    .padding(.leading, 20.0)
                                    .foregroundColor(Color.white)

                                Spacer()
                            }
                            HStack{
                                ArticleCard()
                                    .padding(.leading, 20)
                                Spacer()
                                ArticleCard()
                                Spacer()
                                ArticleCard()
                                    .padding(.trailing, 20)
                                
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.23)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                        
                        //Calendar
                        VStack{
                            Text("Calender")
                                .font(.title2)
                                .padding()
                                .foregroundColor(Color.white)

                            HStack{
                                Text("Select day")
                                    .font(.caption)
                                    .padding(.leading, 20)
                                    .foregroundColor(Color.white)

                                Spacer()
                            }
                            HStack{
                                let days = ["S", "M", "T", "W", "T", "F", "S"]
                                ForEach(0..<7) { index in
                                    ZStack {
                                        Circle()
                                            .stroke(Color.white, lineWidth: 1)
                                            .frame(width: 40, height: 40)

                                        Text(days[index])
                                            .foregroundColor(Color.white)

                                    }
                                }
                            }
                            .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.23)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                        
                        //Recent Rants
                        VStack{
                            HStack{
                                Text("Recent Rants")
                                    .font(.title3)
                                Spacer()
                                NavigationLink(destination: EntriesListView().environmentObject(JournalStore(preview: true)).environmentObject(userPreferences)) {
                                    Text("All Rants")
                                        .frame(width: 80, height: 30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                            }
                            .foregroundColor(Color.white)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                            
                            Divider().background(Color.white)
                            
                            //generateSessionCards()
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                        
                        
                        Text("").padding(.bottom, 40)
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
            .onAppear{
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
            .environmentObject(UserPreferences())
    }
}
