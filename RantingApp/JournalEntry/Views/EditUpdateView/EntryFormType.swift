//
//  EntryFormType.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import SwiftUI

enum EntryFormType: Identifiable, View{
    case new
    case update(JournalEntry)
    var id: String{
        switch self{
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View{
        switch self{
        case .new:
            return EntryFormView(viewModel: EntryFormViewModel())
        case .update(let entry):
            return EntryFormView(viewModel: EntryFormViewModel(entry))
        }
    }
}
