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
    
    var body: some View{
        VStack{
            Text("So, what's going on buddy?")
            TextEditor(text: $journalText)
                .frame(height: 200)
                .padding()
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
}

struct RantSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RantSessionView()
            .environmentObject(RantSessionManager())
    }
}
