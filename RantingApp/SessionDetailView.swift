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
        let mockSession = RantSession(text: "Mock text", emoji: "😡", date: "Created: 22 May 2023")
        SessionDetailView(session: mockSession)
    }
}

