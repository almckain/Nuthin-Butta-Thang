//
//  RantSessionView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI
    
struct RantSessionView: View {
    
    @EnvironmentObject var sessionManager: RantSessionManager
    @State private var journalText: String = ""
    @State private var currentDate: String = ""
    @State private var selectedEmoji: String?
    
    let emojis: [String: String] = [
        "😡": "Anger, frustration, or annoyance.",
        "😭": "Sadness, grief, or deep emotional distress.",
        "😤": "Frustration, irritation, or indignation.",
        "😩": "Exhaustion, stress, or being overwhelmed.",
        "🤬": "Intense anger, cursing, or feeling overwhelmed with negative emotions.",
        "🤯": "Being overwhelmed, shocked, or amazed.",
        "😓": "Anxiety, stress, or a sense of relief after venting.",
        "🙄": "Annoyance, exasperation, or feeling fed up.",
        "🤔": "Confusion, contemplation, or the need to reflect on the situation.",
        "🤐": "The desire to hold back or keep quiet about something."
    ]

    var body: some View{
        VStack{
            Text("So, what's going on buddy?")
            TextEditor(text: $journalText)
                .frame(height: 200)
                .padding()
            //createEmojiSelector()
            HStack{
                Text("Created on:")
                Text(currentDate)
            }
            .onAppear{
                currentDate = getCurrentDateAndTime()
            }
            Button(action: {
                sessionManager.addSession(withText: journalText)
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Rant Session")
    }
    @Environment(\.presentationMode) var presentationMode
    
    func getCurrentDateAndTime() -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: currentDate)
    }
    
    func createEmojiSelector() -> some View{
        ForEach(emojis.keys.sorted(), id: \.self) { emoji in
            Text(emoji)
                .font(.system(size: 40))
                .padding(.horizontal, 10)
                .opacity(emoji == selectedEmoji ? 1.0 : 0.3)
                .onTapGesture {
                    selectedEmoji = emoji
                }
        }
    }
}

struct RantSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RantSessionView()
            .environmentObject(RantSessionManager())
    }
}
