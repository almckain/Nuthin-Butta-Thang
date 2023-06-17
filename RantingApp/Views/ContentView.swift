//
//  ContentView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .house
    
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            switch selectedTab {
            case .house:
                HomeScreenView()
            case .calendar:
                MoodCalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            case .list_clipboard:
                PastRantSessionsView()
            case .list:
                RemindersView()
            case .gearshape:
                SettingsView()
            }
            VStack{
                Spacer()
                CustomTabBar(selectedTab: $selectedTab).environmentObject(userPreferences)
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
