//
//  ListViewRows.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/17/23.
//

import SwiftUI

struct ListViewRows: View {
    let entry: JournalEntry
    @Binding var formType: EntryFormType?
    var body: some View {
        HStack{
            HStack(alignment: .center){
                Text(entry.emoji)
                    .font(.system(size: 50))
                VStack(alignment: .leading){
                    Text(entry.text)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                }
                

            }
            Spacer()
            Button{
                formType = .update(entry)
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
        }
    }
}

struct ListViewRows_Previews: PreviewProvider {
    static let entry = JournalEntry(text: "I be big sad sometimes because starbucks is expensive.", emoji: "🙃", date: Date(), socialInteraction: false, exercise: true, stressLevel: 0, productivityLevel: 0, anxietyLevel: 2, depressionLevel: 4)
    static var previews: some View {
        ListViewRows(entry: entry, formType: .constant(.new))
    }
}
