//
//  EntryFormView.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import SwiftUI

struct EntryFormView: View {
    @EnvironmentObject var journalStore: JournalStore
    @EnvironmentObject var userPreferences: UserPreferences

    @StateObject var viewModel: EntryFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    
    
           
    var body: some View {
        VStack{
            if viewModel.updating {
                Text(dateToString(date: viewModel.date))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
            } else{
                Text("Today's Entry")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
            }
            
            Form{
                if !viewModel.updating{
                    Section{
                        DatePicker(selection: $viewModel.date, displayedComponents: .date){
                            Text("Date Created:")
                        }
                    }
                    
                }
                //Location
                Section{
                    Text("Location:")
                }
                
                //Picture and emoji selector
                ImageUploadView()
                
                Section{
                    TextField("Title (optional): ", text: $viewModel.title)
                }
                
                Section{
                    TextField("What's going on, buddy?", text: $viewModel.text, axis: .vertical)
                }
                
                Section(footer:
                            HStack{
                    Spacer()
                    Button{
                        if viewModel.updating {
                            let entry = JournalEntry(id: viewModel.id!,
                                                     text: viewModel.text,
                                                     emoji: viewModel.emoji,
                                                     title: viewModel.title,
                                                     date: viewModel.date)
                            journalStore.update(entry)
                        }else{
                            let newEntry = JournalEntry(text: viewModel.text,
                                                        emoji: viewModel.emoji,
                                                        title: viewModel.title,
                                                        date: viewModel.date)
                            journalStore.add(newEntry)
                        }
                        dismiss()
                    }label:{
                        Text(viewModel.updating ? "Update Journal Entry" :"New Journal Entry")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.incomplete)
                    Spacer()
                }
                ){
                    EmptyView()
                }
            }
        }
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(viewModel: EntryFormViewModel())
            .environmentObject(JournalStore())
            .environmentObject(UserPreferences())
    }
}
