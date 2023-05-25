//
//  HomeScreenView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var affirmation: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                //Changes background color
                Color(red: 230/255, green: 230/255, blue: 250/255)
                    .ignoresSafeArea()
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
                    HStack{
                        Spacer()
                        Text(affirmation.isEmpty ? "Fetching affirmation..." : affirmation)
                            .multilineTextAlignment(.center)
                            
                        Spacer()
                    }
                    Divider()
                     
                    Spacer()
                }
            }
            .onAppear {
                fetchAffirmation()
            }
        }
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
    }
}
