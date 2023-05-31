//
//  ColorThemeView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/27/23.
//

import SwiftUI

struct ColorThemeView: View {
    @EnvironmentObject var userPreferences: UserPreferences
    var body: some View {
        
        let colorArray: [(name: String, colors: (preview: Color, primary: Color, middle: Color, secondary: Color))] = [
            (name: "purple", colors: (preview: Color(red:171/255, green:141/255, blue:246/255),
                                      primary: Color(red: 90/255, green: 51/255, blue: 156/255),
                                      middle: Color(red: 166/255, green: 136/255, blue: 240/255),
                                      secondary: Color(red: 188/255, green: 160/255, blue: 233/255))),
            
            (name: "red", colors: (preview: Color(red:222/255, green:120/255, blue:157/255),
                                   primary: Color(red: 214/255, green: 109/255, blue: 92/255),
                                   middle: Color(red: 216/255, green: 116/255, blue: 152/255),
                                   secondary: Color(red: 224/255, green: 127/255, blue: 226/255))),
            
            (name: "orange", colors: (preview: Color(red:242/255, green:169/255, blue:132/255),
                                      primary: Color(red: 206/255, green: 161/255, blue: 78/255),
                                      middle: Color(red: 234/255, green: 162/255, blue: 125/255),
                                      secondary: Color(red: 226/255, green: 156/255, blue: 170/255))),
            
            (name: "yellow", colors: (preview: Color(red:253/255, green:249/255, blue:160/255),
                                      primary: Color(red: 196/255, green: 227/255, blue: 126/255),
                                      middle: Color(red: 228/255, green: 223/255, blue: 137/255),
                                      secondary: Color(red: 228/255, green: 215/255, blue: 125/255))),
            
            (name: "green", colors: (preview: Color(red:186/255, green:219/255, blue:147/255),
                                     primary: Color(red: 144/255, green: 207/255, blue: 140/255),
                                     middle: Color(red: 174/255, green: 208/255, blue: 137/255),
                                     secondary: Color(red: 202/255, green: 211/255, blue: 111/255))),
            
            (name: "blue", colors: (preview: Color(red:127/255, green:165/255, blue:248/255),
                                    primary: Color(red: 139/255, green: 136/255, blue: 223/255),
                                    middle: Color(red: 121/255, green: 160/255, blue: 241/255),
                                    secondary: Color(red: 106/255, green: 196/255, blue: 234/255))),
            
            (name: "grey", colors: (preview: Color(red:181/255, green:167/255, blue:182/255),
                                    primary: Color(red: 168/255, green: 150/255, blue: 159/255),
                                    middle: Color(red: 175/255, green: 161/255, blue: 176/255),
                                    secondary: Color(red: 187/255, green: 176/255, blue: 201/255)))
        ]
        
            
        /**
         
            WHENEVER EDITING TEXT, CHANGE BACKGROUND COLOR FROM WHITE TO BLUE (or whatever, you want) SWITCH BACK TO WHITE AFTERWARDS THOUGH
         
         */
            VStack{
                Text("Select Theme")
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.08)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(40)
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .padding(.top)
                Spacer()
                HStack {
                    ForEach(colorArray, id: \.name) { name, colors in
                        ZStack {
                            Circle()
                                .fill(colors.preview) // fill the circle with the preview color from the dictionary
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Circle()
                                        .stroke(userPreferences.selectedColorName == name ? Color.white : Color.gray, lineWidth: 4)
                                )
                                .onTapGesture {
                                    userPreferences.primaryColor = colors.primary
                                    userPreferences.middleColor = colors.middle
                                    userPreferences.secondaryColor = colors.secondary
                                    userPreferences.selectedColorName = name
                                    
                                }
                            
                        }
                    }
                }
                .padding()
                .padding(.bottom, 35)
            }
        

    }
}

 struct ColorThemeView_Previews: PreviewProvider {
     static var previews: some View {
         ColorThemeView().environmentObject(UserPreferences())
     }
 }
 
