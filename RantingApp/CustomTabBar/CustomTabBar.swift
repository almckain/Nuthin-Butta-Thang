//
//  CustomTabBar.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/19/23.
//
/*
import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack{
            Button{
                
            }label:{
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Home")
                }
            }
            
            Button{
                
            }label:{
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "list.bullet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Entries")
                }
            }
            
            Button{
                
            }label:{
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Calendar")
                }
            }
            
            Button{
                
            }label:{
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Settings")
                }
            }
        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
*/

 //
 //  CustomTabBar.swift
 //  RantingApp
 //
 //  Created by Aaron McKain on 5/31/23.
 //

 import SwiftUI

 enum Tab: String, CaseIterable{
     //Names must be the same as an SF Symbol
     case house
     case calendar
     case list
     case gearshape
     
     
     var sfSymbolName: String {
         switch self {
         case .house:
             return "house"
             
         case .calendar:
             return "calendar.circle"
             
         case .list:
             return "list.bullet.circle"
             
         case .gearshape:
             return "gearshape"
         
         }
     }
     
     var sfSymbolNameFilled: String {
         return self.sfSymbolName + ".fill"
     }
 }

 struct CustomTabBar: View {
     @Binding var selectedTab: Tab
     @EnvironmentObject var userPreferences: UserPreferences
     private var fillImage: String{
         selectedTab.sfSymbolNameFilled
     }
     var body: some View {
         VStack{
             HStack{
                 ForEach(Tab.allCases, id: \.rawValue){ tab in
                     Spacer()
                     Image(systemName: selectedTab == tab ? fillImage : tab.sfSymbolName)
                         .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                         .foregroundColor(selectedTab == tab ? userPreferences.primaryColor.opacity(0.8) : userPreferences.primaryColor.opacity(0.5))
                         .font(.system(size: 20))
                         .onTapGesture{
                             withAnimation(.easeIn(duration: 0.1)){
                                 selectedTab = tab
                             }
                         }
                     Spacer()
                 }
             }
             .frame(width: nil, height: 60)
             .background(Color.white)
             .cornerRadius(10)
             .padding()
         }
         .edgesIgnoringSafeArea(.bottom)
     }
 }

 struct CustomTabBar_Previews: PreviewProvider {
     static var previews: some View {
         CustomTabBar(selectedTab: .constant(.house)).environmentObject(UserPreferences())
     }
 }

 
 
