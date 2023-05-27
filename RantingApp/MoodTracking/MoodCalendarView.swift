//
//  MoodCalendarView.swift
//  RantingApp
//
//  Created by Aaron McKain on 5/26/23.
//

import SwiftUI
/*
 struct MoodCalendarView: View {
 let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
 @State var daysOfMonth: [Day] = []
 
 var body: some View {
 VStack(alignment: .leading) {
 // Create a row for the days of the week
 HStack {
 ForEach(daysOfWeek, id: \.self) { day in
 Text(day)
 .frame(width: 40, height: 40)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(20)
 }
 }
 
 // Create a grid for the days of the month
 let rows = daysOfMonth.count / 7
 ForEach(0..<rows, id: \.self) { rowIndex in
 HStack {
 ForEach(0..<7, id: \.self) { columnIndex in
 let dayIndex = rowIndex * 7 + columnIndex
 if dayIndex < daysOfMonth.count {
 NavigationLink(destination: DayDetailView(day: daysOfMonth[dayIndex])) {
 Text("\(daysOfMonth[dayIndex].date)")
 .frame(width: 40, height: 40)
 .background(Color.blue.opacity(0.2))
 .cornerRadius(20)
 }
 } else {
 // Empty view for days of the next month
 Text("")
 .frame(width: 40, height: 40)
 .background(Color.clear)
 }
 }
 }
 }
 }
 .onAppear {
 // Populate the daysOfMonth array with the days of the current month
 daysOfMonth = populateDaysOfMonth()
 }
 }
 
 func populateDaysOfMonth() -> [Day] {
 // Your implementation here...
 }
 }
 
 
 struct MoodCalendarView_Previews: PreviewProvider {
 static var previews: some View {
 MoodCalendarView()
 }
 }
 */
