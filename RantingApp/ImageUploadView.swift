//
//  ImageUploadView.swift
//  RantingApp
//
//  Created by Aaron McKain on 7/3/23.
//

import SwiftUI

struct ImageUploadView: View {
    var body: some View {
        HStack{
            HStack{
                ZStack{
                    Circle()
                        .stroke(Color("DarkPurple"), lineWidth: 1)
                        .frame(width: 50, height: 50)
                    Image(systemName: "camera")
                        .foregroundColor(Color("DarkPurple"))
                }
                Text("Upload a\nthumbnail")
                    .foregroundColor(Color("DarkPurple"))

            }
            Spacer()
            HStack{
                ZStack{
                    Circle()
                        .stroke(Color("DarkPurple"), lineWidth: 1)
                        .frame(width: 50, height: 50)
                    Image(systemName: "plus")
                        .foregroundColor(Color("DarkPurple"))

                }
                Text("Emoji\nthumbnail")
                    .foregroundColor(Color("DarkPurple"))

            }
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
