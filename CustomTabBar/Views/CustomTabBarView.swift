//
//  CustomTabBarView.swift
//  RantingApp
//
//  Created by Aaron McKain on 7/2/23.
//  Code from Swiftful Thinking ~https://www.youtube.com/@SwiftfulThinking


import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection, perform: { value in
                withAnimation(.easeInOut){
                    localSelection = value
                }
            })
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home,
        .calendar,
        .list,
        .settings
    ]
    
    static var previews: some View {
        VStack{
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView{
    private func tabView(tab: TabBarItem) -> some View{
        VStack{
            Image(systemName: tab.iconName)
                .font(.title2)
            
        }
        .foregroundColor(localSelection == tab ? Color.purple : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? Color.purple.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View{
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem){
        selection = tab
    }
}

extension CustomTabBarView{
    private func tabView2(tab: TabBarItem) -> some View{
        VStack{
            Image(systemName: tab.iconName)
                .font(.title2)
            
        }
        .foregroundColor(localSelection == tab ? Color.purple : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View{
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}


