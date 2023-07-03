//
//  AppTabBarView.swift
//  RantingApp
//
//  Created by Aaron McKain on 7/2/23.
//  Code from Swiftful Thinking ~https://www.youtube.com/@SwiftfulThinking


import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            HomeView(userPreference: UserPreferences()) //Home Screen 
                .tabBarItem(tab: .home, selection: $tabSelection)
            EventsCalendarView()
                .tabBarItem(tab: .calendar, selection: $tabSelection)
            EntriesListView().environmentObject(JournalStore(preview: true))
                .tabBarItem(tab: .list, selection: $tabSelection)
            SettingsView()
                .tabBarItem(tab: .settings, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView{
    private var defaultTabView: some View{
        TabView(selection: $selection){
            Color.red //Different view
                .tabItem{
                    Image(systemName: "house")
                }
            Color.blue //Different view
                .tabItem{
                    Image(systemName: "calendar")
                }
            Color.orange //Different view
                .tabItem{
                    Image(systemName: "list.bullet")
                }
            Color.green //Different view
                .tabItem{
                    Image(systemName: "gear")
                }
        }
    }
}

