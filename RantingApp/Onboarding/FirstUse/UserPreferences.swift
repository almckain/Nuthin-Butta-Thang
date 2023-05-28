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
    @Published var exercise: Bool = false
    @Published var stress: Bool = false
    @Published var anxiety: Bool = false
    @Published var depression: Bool = false
    
    //Color Theme
    @Published var primaryColor: Color = Color(red: 99/255, green: 56/255, blue: 174/255)
    @Published var secondaryColor: Color = Color(red: 185/255, green: 158/255, blue: 229/255)

}

