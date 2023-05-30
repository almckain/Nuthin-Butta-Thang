//
//  ContentView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager
    
    var body: some View {
        TabView {
            HomeScreenView().environmentObject(userPreferences).environmentObject(sessionManager)
                .tabItem {
                  Image(systemName: "house")
                  Text("Home")
            }
            SettingsView()
                .tabItem {
                  Image(systemName: "gear")
                  Text("Settings")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RantSessionManager())
            .environmentObject(UserPreferences())
    }
}
