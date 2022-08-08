//
//  ContentView.swift
//  TeslaApp
//
//  Created by Matheus Souza on 01/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing: 10){
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(title: "Quick Shortcuts",showEdit: true)
                    CustomDivider()
                    CategoryView(title: "Recent Actions")
                    
                }
                .padding()
            }
            VoiceCommandButton()
        }
        .frame(maxWidth:.infinity,maxHeight:.infinity)
        .background(Color("Background"))
        .foregroundColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct VoiceCommandButton: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image(systemName:"mic.fill")
                    .font(.system(size:24,weight:.semibold,design:
                            .default))
                    .frame(width: 64, height: 64)
                    .background(Color("Green"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}


struct HomeHeader:View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text("Model3".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .foregroundColor(Color.white)
                    .background(Color("Red"))
                    .clipShape(Capsule())
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack{
                Button(action: {}){
                    GeneralButton(icon: "lock.fill")
                }
                
                Button(action: {}){
                    GeneralButton(icon: "gear")
                }
                
            }
        }
        .padding(.top)
    }
    
    
}

struct GeneralButton:View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.05))
            .clipShape(Circle())
            .overlay(){
                Circle()
                    .stroke(Color.white.opacity(0.1),lineWidth:0.5)
            }
    }
}

struct CustomDivider: View {
    var body: some View{
        Rectangle()
            .frame(maxWidth:.infinity)
            .frame(height:0.25)
            .background(Color.white)
            .opacity(0.1)
    }
}

struct CarSection: View {
    var body: some View {
        VStack(spacing: 10){
            HStack(alignment: .center){
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 miles".uppercased())
                }
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Green"))
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated: 5min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Image("car_img")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CategoryHeader : View{
    var title: String
    var showEdit: Bool = false
    
    var body: some View{
        HStack(alignment: .center){
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            if showEdit{
                Button(action: {}){
                    Text("Edit")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
            }
            
        }
    }
}

struct CategoryView : View{
    var title: String
    var showEdit: Bool = false
    
    var body: some View{
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ActionButton(icon: "bolt.fill", text: "Chargin")
                    ActionButton(icon: "fanblades.fill", text: "Fan On")
                    ActionButton(icon: "music.note", text: "Media Controls")
                    ActionButton(icon: "bolt.car", text: "Close Charge Port")
                }
            }
        }
    }
}

struct ActionButton: View{
    var icon: String
    var text: String
    
    var body: some View{
        VStack(alignment: .center){
            GeneralButton(icon: icon)
            Text(text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}
