//
//  StartTabView.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import SwiftUI

struct StartTabView: View {
    @EnvironmentObject var myEntries: JournalStore
    var body: some View {
        TabView{
            EntriesListView()
                .tabItem{
                    Label("List", systemImage: "list.triangle")
                }
            EventsCalendarView()
                .tabItem{
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(JournalStore(preview: true))
    }
}
