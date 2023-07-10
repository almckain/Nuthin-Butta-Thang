//
//  CustomTabBarContainerView.swift
//  RantingApp
//
//  Created by Aaron McKain on 7/2/23.
//  Code from Swiftful Thinking ~https://www.youtube.com/@SwiftfulThinking

import SwiftUI
                    
struct CustomTabBarContainerView<Content:View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .ignoresSafeArea(edges: .bottom)
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home,
        .calendar,
        .list,
        .settings
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)){
            Color.green
        }
    }
}

