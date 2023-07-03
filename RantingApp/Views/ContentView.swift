//
//  ContentView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/29/23.
//

import SwiftUI

struct ContentView: View {
        
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var myEntries: JournalStore
    
    var body: some View {
        AppTabBarView()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(JournalStore(preview: true))
            .environmentObject(UserPreferences())
    }
}
