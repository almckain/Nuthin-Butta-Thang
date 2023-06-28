//
//  UserPreference.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import Foundation
import UIKit
import SwiftUI

class UserPreferences: ObservableObject {
    
    //Mood tracking
    @Published var socialInteraction: Bool = false
    @Published var exercise: Bool = true
    @Published var stress: Bool = false
    @Published var anxiety: Bool = true
    @Published var depression: Bool = false
    
    //Color Theme
    @Published var primaryColor: Color = Color(red: 99/255, green: 56/255, blue: 174/255) //Darker
    @Published var middleColor: Color = Color(red: 166/255, green: 136/255, blue: 240/255) //Middle
    @Published var secondaryColor: Color = Color(red: 185/255, green: 158/255, blue: 229/255) //Lighter
    
    @Published var lightPurple: Color = Color(red: 172/255, green: 107/255, blue: 255/255)
    @Published var darkPurple: Color = Color(red: 167/255, green: 104/255, blue: 229/255)
    @Published var uiGrey: Color = Color(red: 223/255, green: 223/255, blue: 223/255).opacity(0.30)
    
    @Published var selectedColorName: String = "purple" // Default color


}

