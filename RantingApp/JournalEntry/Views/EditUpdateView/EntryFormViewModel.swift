//
//  EntryFormViewModel.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import Foundation

class EntryFormViewModel: ObservableObject{
    @Published var date = Date()
    @Published var text = ""
    @Published var emoji = ""
    @Published var title = ""
    
    var id: String?
    var updating: Bool { id != nil }
    
    init(){}
    
    init(_ entry: JournalEntry){
        date = entry.date
        text = entry.text
        emoji = entry.emoji
        id = entry.id
        title = entry.title
    }
    
    var incomplete: Bool{
        text.isEmpty
    }
}
