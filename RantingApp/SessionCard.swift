//
//  SessionCard.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/24/23.
//

import SwiftUI

struct SessionCard: View {
    
    var session : RantSession
    
    var body: some View {
        HStack{
            Text("😎")
                .font(.system(size: 48))
                .padding(.leading)
            VStack(alignment: .leading){
                Text(getRantPreview(for: session.text))
                    .font(.title2)
                Text("Created: May 23 2023")
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.10)
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private func getRantPreview(for text: String) -> String{
        if text.count > 25{
            return String(text.prefix(22)) + "..."
        }else{
            return text
        }
    }
}
