//
//  PetView.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/28/23.
//

import SwiftUI

struct PetView: View {
    @EnvironmentObject var userPreference: UserPreferences

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 27, style: .continuous)
                .frame(height: 206)
                .foregroundStyle(
                    .gray.gradient.shadow(.inner(color: .black.opacity(0.99), radius: 7, x: 1, y: 1)).opacity(0.1)
                )
            
            Image("Pet_Lucy")
                .resizable()
                .frame(width: 68, height: 58)
        }
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView().environmentObject(UserPreferences())
    }
}


