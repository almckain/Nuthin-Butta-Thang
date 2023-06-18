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
                        .sheet(isPresented: $showingEmojiPicker) {
                            EmojiPickerView(selectedEmoji: $viewModel.emoji, showingEmojiPicker: $showingEmojiPicker)
                        }
                    }
                    
                    if userPreferences.exercise {
                        Toggle("Did you exercise?", isOn: $viewModel.exercise)
                    }
                    
                    if userPreferences.socialInteraction {
                        Toggle("Are you social?", isOn: $viewModel.socialInteraction)
                    }
                    
                    if userPreferences.stress {
                        Text("Stress Level")
                        HStack {
                            ForEach(1...5, id: \.self) { level in
                                Circle()
                                    .foregroundColor(viewModel.stressLevel >= level ? .blue : .gray)
                                    .frame(width: 20, height: 20)
                                    .onTapGesture {
                                        viewModel.stressLevel = level
                                    }
                            }
                        }
                    }
                    
                    if userPreferences.anxiety {
                        HStack{
                            Text("Anxiety Level")
                            Spacer()
                            HStack {
                                ForEach(1...5, id: \.self) { level in
                                    Circle()
                                        .foregroundColor(viewModel.anxietyLevel >= level ? .blue : .gray)
                                        .frame(width: 20, height: 20)
                                        .onTapGesture {
                                            viewModel.anxietyLevel = level
                                        }
                                }
                            }
                        }
                    }
                    
                    if userPreferences.depression {
                        Text("Depression Level")
                        HStack{
                            ForEach(1...5, id: \.self) { level in
                                Circle()
                                    .foregroundColor(viewModel.depressionLevel >= level ? .blue : .gray)
                                    .frame(width: 20, height: 20)
                                    .onTapGesture {
                                        viewModel.depressionLevel = level
                                    }
                            }
                        }
                    }
                    Section(footer:
                                HStack{
                        Spacer()
                        Button{
                            if viewModel.updating {
                                let entry = JournalEntry(id: viewModel.id!,
                                                         text: viewModel.text,
                                                         emoji: viewModel.emoji,
                                                         date: viewModel.date,
                                                         socialInteraction: viewModel.socialInteraction,
                                                         exercise: viewModel.exercise,
                                                         stressLevel: viewModel.stressLevel,
                                                         productivityLevel: viewModel.productivityLevel,
                                                         anxietyLevel: viewModel.anxietyLevel,
                                                         depressionLevel: viewModel.depressionLevel)
                                journalStore.update(entry)
                            }else{
                                let newEntry = JournalEntry(text: viewModel.text,
                                                            emoji: viewModel.emoji,
                                                            date: viewModel.date,
                                                            socialInteraction: viewModel.socialInteraction,
                                                            exercise: viewModel.exercise,
                                                            stressLevel: viewModel.stressLevel,
                                                            productivityLevel: viewModel.productivityLevel,
                                                            anxietyLevel: viewModel.anxietyLevel,
                                                            depressionLevel: viewModel.depressionLevel)
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
        }
    }
}

struct EmojiPickerView: View {
    @Binding var selectedEmoji: String
    @Binding var showingEmojiPicker: Bool
    
    let emojis: [String] = (0x1F600...0x1F64F).compactMap { UnicodeScalar($0)?.description }

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

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(viewModel: EntryFormViewModel())
            .environmentObject(JournalStore())
            .environmentObject(UserPreferences())
    }
}
