//
//  MoodCalendarView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import SwiftUI

struct MoodCalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var eventStore: EventStore
    
    func makeUIView(context: Context) -> UICalendarView{
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
}
 
/*
 struct MoodCalendarView_Previews: PreviewProvider {
 static var previews: some View {
 MoodCalendarView()
 }
 }
 */
