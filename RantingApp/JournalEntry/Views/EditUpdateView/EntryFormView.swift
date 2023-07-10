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
    
    @State private var userInput: String = ""
    @State private var entryTitle: String = ""
    
           
    var body: some View {
        ZStack{
            Image("TemplateTemplate")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .offset(x: 0, y:180)
            ScrollView{
                VStack{
                    if viewModel.updating {
                        Text(dateToString(date: viewModel.date))
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 20)
                    } else{
                        Text("New Journal Entry")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 20)
                    }
                    //Date Tab
                    if !viewModel.updating{
                        ZStack{
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color("uiGrey")).opacity(0.3)
                                .frame(height: 38)
                                .shadow(color: .blue.opacity(0.59), radius: 8, x: 0, y: 4)
                            HStack{
                                Text("Date & Time:")
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Text(dateToString(date: Date()))
                                    .multilineTextAlignment(.trailing)
                            }
                            .padding(15)
                            
                        }
                    }
                    
                    //Location Tab
                    ZStack{
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color("uiGrey")).opacity(0.3)
                            .frame(height: 38)
                            .shadow(color: .blue.opacity(0.59), radius: 8, x: 0, y: 4)
                        HStack{
                            Text("Location:")
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text("Location")
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(15)
                        
                    }
                    
                    //Thumbnail Tab
                    ImageUploadView()
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                    
                    //Title
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("uiGrey")).opacity(0.3)
                            .frame(height: 38)
                            .shadow(color: .blue.opacity(0.59), radius: 8, x: 0, y: 4)
                        TextField("Title (optional)", text: $viewModel.title)
                            .padding()
                            .background(Color.clear.cornerRadius(20))
                            .font(.headline)
                    }.padding(.top, 15)
                    
                    //Body content
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("uiGrey")).opacity(0.3)
                            .frame(height: 470)
                            .shadow(color: .blue.opacity(0.59), radius: 8, x: 2, y: 8)
                        TextField("So, what's going on buddy?", text: $viewModel.text, axis: .vertical)
                            .padding()
                            .lineLimit(20...)
                            .background(Color.clear.cornerRadius(20))
                    }.padding(.top, 15)
                    
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
                    .padding(.top, 25)
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.incomplete)
                    
                    Text("").padding(.bottom, 800)
                }
                .padding(.horizontal, 25)
                .padding(.top, 250)
            }
            EmptyView()
        }
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
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

private extension EntryFormView{
    var textEditorVw: some View{
        TextEditor(text: $userInput)
            .cornerRadius(25)
            .frame(height: 250)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("uiGrey")).opacity(0.2)
                    .shadow(color: .black.opacity(0.49), radius: 8, x: 0, y: 4)
            )
    }
}
