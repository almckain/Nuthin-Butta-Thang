//
//  HomeView.swift
//  RantingApp
//
//  Created by Aaron McKain on 6/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var status: CGFloat = 0.7
    
    var userPreference: UserPreferences
    
    @State private var offset = CGSize.zero
    @State private var flipImage = false
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    var enableAnimation = false // Change this to enable or disable the animation

    var body: some View {
        NavigationView{
            ZStack {
                Image("TemplateTemplate") // Replace "background" with your PDF's name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .offset(x: 0, y:180)
                ScrollView{
                    VStack {
                        HStack{
                            Text("Good morning, Aaron")
                                .font(.system(size: 28, weight: .bold, design: .default))
                                .foregroundColor(Color.black)
                                .padding(.top, 260)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        HStack{
                            Text("You're 6 days away from your reward:")
                                .font(.callout)
                            Spacer()
                            Image(systemName: "gift")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(userPreference.lightPurple)
                        }.padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 25))
                        
                        generateStatusBar(progress: status)
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        
                        HStack{
                            Text("Keep up the good work:")
                                .font(.callout)
                            Spacer()
                        }.padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 15))
                        
                        HStack{
                            generateProgressSquare(title: "Average", value: 4)
                            Spacer()
                            generateProgressSquare(title: "Goal", value: 3)
                            Spacer()
                            generateProgressSquare(title: "Total", value: 9)
                            
                        }.padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 15))
                    }
                    VStack{
                        HStack{
                            generateStreakWidget()
                            
                        }.padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 15))
                        
                        NavigationLink(destination: Text("Destination View")) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(userPreference.darkPurple)
                                    .frame(height: 40)
                                    .shadow(color: .black.opacity(0.10), radius: 4, x: 0, y: 8)
                                
                                Text("View Today's Entry")
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }.padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 15))
                        
                        NavigationLink(destination: Text("Destination View")) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(userPreference.darkPurple, lineWidth: 2)
                                    .frame(height: 40)
                                
                                Text("All Entries")
                                    .fontWeight(.light)
                                    .foregroundColor(userPreference.darkPurple)
                                    .font(.headline)
                            }
                        }
                        .padding(EdgeInsets(top: 1, leading: 15, bottom: 5, trailing: 15))
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .fill(Color("uiGrey")).opacity(0.3)
                                .frame(height: 38)
                                .shadow(color: .black.opacity(0.59), radius: 8, x: 0, y: 4)

                            HStack{
                                Text("Service Pet Lucy!")
                                    .padding(.leading, 25)
                                Spacer()
                            }
                        }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                        
                        //Generate Pet Pen
                        generatePetPen()
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 50, trailing: 15))
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 300)
                        Spacer()
                    
                    }
                }
            }
            
        }
    }
    
    func generateStatusBar(progress: CGFloat) -> some View{
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 20)
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.72, green: 0.63, blue: 1), Color(red: 0.52, green: 0.35, blue: 1)]), startPoint: .leading, endPoint: .trailing))
                .frame(width: UIScreen.main.bounds.width * progress, height: 20)
        }
    }
    
    func generateProgressSquare(title: String, value: Int) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color("uiGrey")).opacity(0.2)
                .frame(width: 108, height: 98)
                .shadow(color: .black.opacity(0.50), radius: 4, x: 0, y: 8)
              //.shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("\(value)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(userPreference.darkPurple)
            }
        }
    }
    
    func generateDayTab(date: String, didEnter: Bool) -> some View{
        VStack{
            ZStack{
                if didEnter{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 44, height: 49)
                        .background(userPreference.darkPurple)
                        .cornerRadius(10)
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                }else{
                    RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                            .foregroundColor(userPreference.lightPurple)
                            .frame(width: 44, height: 49)
                        Image(systemName: "questionmark")
                        .resizable()
                        .frame(width: 15, height: 23)
                        .foregroundColor(userPreference.lightPurple)
                }
            }
            Text(date)
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(userPreference.darkPurple)
        }
    }
    
    func generateStreakWidget() -> some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 22)
                .fill(Color("uiGrey")).opacity(0.2)
                .frame(height: 155)
                .shadow(color: .black.opacity(0.50), radius: 3, x: 0, y: 8)
            VStack{
                HStack{
                    Text("You're on a 4 day streak!")
                        .foregroundColor(userPreference.darkPurple)
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Spacer()
                }
                HStack{
                    generateDayTab(date: "Jun 25", didEnter: true)
                    generateDayTab(date: "Jun 26", didEnter: true)
                    generateDayTab(date: "Jun 27", didEnter: false)
                    generateDayTab(date: "Jun 28", didEnter: true)
                    generateDayTab(date: "Jun 29", didEnter: true)
                    generateDayTab(date: "Jun 30", didEnter: true)
                    generateDayTab(date: "Jul 1", didEnter: true)
                }
            }
        }
    }
    
    func generatePetPen() -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 27, style: .continuous)
                //.fill(Color.gray).opacity(0.1)
                .frame(height: 206)
                .foregroundStyle(
                    .gray.gradient.shadow(.inner(color: .black.opacity(0.99), radius: 7, x: 1, y: 1)).opacity(0.1)
                )
                //.shadow(color: Color.blue.opacity(0.99), radius: 5, x: 10, y: 0)
                

            
            Image("Pet_Lucy")
                .resizable()
                .frame(width: 68, height: 58)
                .scaleEffect(x: flipImage ? -1 : 1, y: 1, anchor: .center)
                .offset(offset)
                .onReceive(timer) { _ in
                    if enableAnimation {
                        withAnimation {
                            let maxX = CGFloat.random(in: -100...100) // adjust as per needed
                            let maxY = CGFloat.random(in: -100...100) // adjust as per needed
                            flipImage = maxX > offset.width
                            offset = CGSize(width: maxX, height: maxY)
                        }
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userPreference: UserPreferences())
    }
}
