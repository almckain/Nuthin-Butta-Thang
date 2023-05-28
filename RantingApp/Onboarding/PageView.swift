//
//  PageView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/28/23.
//

import SwiftUI

struct PageView: View {
    let currentView: AnyView
    let lastPage: Bool
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        VStack{
            currentView
            if lastPage{
                Button {
                    shouldShowOnBoarding.toggle()
                } label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(12)
                }

            }
        }
    }
}

