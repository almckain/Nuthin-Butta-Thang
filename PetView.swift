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
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 206)
                .background(userPreference.uiGrey)
                .cornerRadius(27)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
            
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


