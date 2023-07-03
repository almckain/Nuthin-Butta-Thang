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
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: 50, height: 50)
                    Image(systemName: "camera")
                }
                Text("Upload a\nthumbnail")
            }
            Spacer()
            HStack{
                ZStack{
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: 50, height: 50)
                    Image(systemName: "plus")
                }
                Text("Emoji\nthumbnail")
            }
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
