//
//  RantSession.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/23/23.
//

import Foundation
import SwiftUI

struct RantSession: Identifiable{
    let id = UUID()
    let text: String
    let emoji: String
    let date: String
}
