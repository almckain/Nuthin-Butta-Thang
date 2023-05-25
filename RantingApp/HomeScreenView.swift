//
//  HomeScreenView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/25/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView{
            HStack{
                Spacer()
                NavigationLink(destination: PastRantSessionsView()){
                    Text("New Rant Session")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05)
                        .background(Color.white)
                        .cornerRadius(12)
                }
                Spacer()
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
