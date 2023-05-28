//
//  RantSessionView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import SwiftUI
    
struct RantSessionView: View {
    @EnvironmentObject var userPreferences: UserPreferences
    @EnvironmentObject var sessionManager: RantSessionManager
    @State private var journalText: String = ""
    @State private var currentDate: String = ""
    @State private var selectedEmoji: String = ""
    @State private var exercise: Bool = false
    @State private var social: Bool = false
    @State private var stressLevel: Int = 0
    @State private var anxietyLevel: Int = 0
    @State private var productivityLevel: Int = 0
    
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

    var body: some View {
        VStack {
            Text("So, what's going on buddy?")
            TextEditor(text: $journalText)
                .frame(height: 200)
                .padding()
            createEmojiSelector()
            HStack {
                Text("Created on:")
                Text(currentDate)
            }
            .onAppear {
                currentDate = getCurrentDateAndTime()
            }
            
            
            if userPreferences.exercise {
                Toggle("Did you exercise?", isOn: $exercise)
            }
            
            if userPreferences.socialInteraction {
                Toggle("Are you social?", isOn: $social)
            }
            
            if userPreferences.stress {
                Text("Stress Level")
                HStack {
                    ForEach(1...5, id: \.self) { level in
                        Circle()
                            .foregroundColor(stressLevel >= level ? .blue : .gray)
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                stressLevel = level
                            }
                    }
                }
            }
            
            if userPreferences.anxiety {
                Text("Anxiety Level")
                HStack {
                    ForEach(1...5, id: \.self) { level in
                        Circle()
                            .foregroundColor(anxietyLevel >= level ? .blue : .gray)
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                anxietyLevel = level
                            }
                    }
                }
            }
            
            Button(action: {
                sessionManager.addSession(withText: journalText, withEmoji: selectedEmoji, withDate: currentDate, withSocialInteraction: social, withExercise: exercise, withStressLevel: stressLevel, withProductivityLevel: productivityLevel, withAnxietyLevel: anxietyLevel)
                presentationMode.wrappedValue.dismiss()
            }) {
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
    
    func getCurrentDateAndTime() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: currentDate)
    }
    
    func createEmojiSelector() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(emojis.keys.sorted(), id: \.self) { emoji in
                    Text(emoji)
                        .font(.system(size: 40))
                        .padding(.horizontal, 7)
                        .opacity(emoji == selectedEmoji ? 1.0 : 0.3)
                        .onTapGesture {
                            selectedEmoji = emoji
                        }
                }
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
