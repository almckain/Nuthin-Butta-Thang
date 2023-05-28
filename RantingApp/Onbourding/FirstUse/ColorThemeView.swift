//
//  ColorThemeView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/27/23.
//

import SwiftUI

struct ColorThemeView: View {
    
    @Binding var isFirstLaunch: Bool

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            isFirstLaunch = false
        }) {
            Text("Finish")
        }
    }
}
/*
 struct ColorThemeView_Previews: PreviewProvider {
 static var previews: some View {
 ColorThemeView()
 }
 }
 */
