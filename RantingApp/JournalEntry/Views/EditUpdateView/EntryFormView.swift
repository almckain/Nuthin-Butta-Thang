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
    
    @State private var showingEmojiPicker = false
    
           
    var body: some View {
        NavigationStack{
            
            VStack{
                Form{
                    Section{
                        DatePicker(selection: $viewModel.date, displayedComponents: .date){
                            Text("Date Created:")
                        }
                    }
                    //Location
                    
                    //Picture and emoji selector
                    Section{
                        TextField("Title (optional): ", text: $viewModel.title)
                    }
                    
                    Section{
                        TextField("What's Going on Buddy?", text: $viewModel.text, axis: .vertical)
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
                .navigationTitle(viewModel.updating ? dateToString(date: viewModel.date) : "Today's Entry")
                .onAppear{
                    focus = true
                }
            }
        }
        /*
        NavigationStack{
            VStack{
                Form{
                    DatePicker(selection: $viewModel.date){
                        Text("Date Created")
                    }
                    TextField("What's Going on Buddy?", text: $viewModel.text, axis: .vertical)
                    HStack {
                        Text("Select an emoji")
                        Spacer()
                        TextField("", text: $viewModel.emoji)
                            .frame(width: 40)
                            .disabled(true)
                        Button(action: {
                            self.showingEmojiPicker = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                        /*
                        .sheet(isPresented: $showingEmojiPicker) {
                            EmojiPickerView(selectedEmoji: $viewModel.emoji, showingEmojiPicker: $showingEmojiPicker)
                        }
                         */
                    }
                    
                    Section(footer:
                                HStack{
                        Spacer()
                        Button{
                            if viewModel.updating {
                                let entry = JournalEntry(id: viewModel.id!,
                                                         text: viewModel.text,
                                                         emoji: viewModel.emoji,
                                                         date: viewModel.date)
                                journalStore.update(entry)
                            }else{
                                let newEntry = JournalEntry(text: viewModel.text,
                                                            emoji: viewModel.emoji,
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
            .navigationTitle(viewModel.updating ? "Update" : "New Entry")
            .onAppear{
                focus = true
            }
        }*/
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
/*
struct EmojiPickerView: View {
    @Binding var selectedEmoji: String
    @Binding var showingEmojiPicker: Bool
    
    let emojis: [String] = (0x1F600...0x1F64F).compactMap { String(Character(UnicodeScalar($0))) }
    

    var body: some View {
        VStack(spacing: 20) {
            Text("Select an emoji")
                .font(.headline)
                .padding()
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 4), spacing: 20) {
                    ForEach(emojis, id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 32))
                            .padding()
                            .onTapGesture {
                                self.selectedEmoji = emoji
                                self.showingEmojiPicker = false
                            }
                    }
                }
            }
            
            .padding(.horizontal)
        }
    }
}
*/
struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(viewModel: EntryFormViewModel())
            .environmentObject(JournalStore())
            .environmentObject(UserPreferences())
    }
}
/*
struct EmojiView: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                ForEach(self.getEmojiList(),id: \.self){ i in
                    HStack(spacing: 25){
                        ForEach(i, id: \.self){ j in
                            Button(action: {
                                
                            }){
                                if (UnicodeScalar(j)?.properties.isEmoji)!{
                                    Text(String(UnicodeScalar(j)!)).font(.system(size: 45))
                                }else{
                                    Text("")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func getEmojiList() -> [[Int]]{
        var emojis: [[Int]] = []
        for i in 0x1F601...0x1F64{
            var temp : [Int] = []
            for j in i...i+3{
                temp.append(j)
            }
            emojis.append(temp)
        }
        return emojis
    }
}
*/
