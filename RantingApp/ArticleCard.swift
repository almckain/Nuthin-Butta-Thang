//
//  ArticleCard.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import SwiftUI

struct ArticleCard: View{
    var body: some View{
        HStack{
            Text("Dealing with Anxiety")
                .multilineTextAlignment(.center)
                .padding(.leading, 19.0)

            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.15)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 3))


    }
}
