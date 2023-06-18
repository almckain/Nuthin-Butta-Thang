//
//  EntriesListView.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import SwiftUI

struct EntriesListView: View {
    @EnvironmentObject var myEntries: JournalStore
    @State private var formType: EntryFormType?
    var body: some View {
        NavigationStack{
            List{
                ForEach(myEntries.journalEntries.sorted {$0.date < $1.date}) { entry in
                    ListViewRows(entry: entry, formType: $formType)
                        .swipeActions{
                            Button(role: .destructive){
                                myEntries.delete(entry)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Journal Entries")
            .sheet(item: $formType) { $0 }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

struct EntriesListView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesListView()
            .environmentObject(JournalStore(preview: true))
    }
}
