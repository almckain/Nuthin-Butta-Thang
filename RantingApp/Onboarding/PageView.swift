//
//  PageView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct PageView: View {
    let currentView: AnyView
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        VStack{
            currentView.ignoresSafeArea()
        }
    }
}

