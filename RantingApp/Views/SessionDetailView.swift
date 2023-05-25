//
//  PastSessionView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/24/23.
//

import SwiftUI

struct SessionDetailView: View {
    let session: RantSession
    var body: some View {
        VStack(alignment: .leading) {
            Text("")
            Text(session.text)
                .padding()

            Text(session.emoji)
                .font(.largeTitle)
                .padding()

            Text("Created on: \(session.date)")
                .padding()
        }
        .navigationTitle("Rant Details")
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSession = RantSession(text: "I was running late for work, and as I rushed out the door, I realized my car had a flat tire. I frantically searched for a spare, only to find it was also flat. I was forced to take public transportation, but encountered a long delay, which caused me to miss an important meeting. Once I finally arrived, I realized I had left my wallet at home, leaving me without any money or ID. I spent the day feeling unprepared and inconvenienced, frustrated and flustered.", emoji: "😡", date: "Created: 22 May 2023")
        SessionDetailView(session: mockSession)
    }
}

