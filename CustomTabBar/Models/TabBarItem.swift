//
//  TabBarItem.swift
//  RantingApp
//
//  Created by Aaron McKain on 7/2/23.
//  Code from Swiftful Thinking ~https://www.youtube.com/@SwiftfulThinking


import SwiftUI
import Foundation
/*
struct TabBarItem: Hashable{
    let iconName: String
}
*/
enum TabBarItem: Hashable{
    case home, calendar, list, settings
    
    var iconName: String{
        switch self{
        case .home: return "house"
        case .calendar: return "calendar"
        case .list: return "list.bullet"
        case .settings: return "gear"
        }
    }
}
