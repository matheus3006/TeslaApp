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
                    CategoryView(title: "Quick Shortcuts",showEdit: true, ActionItems: quickShortcuts)
                    CustomDivider()
                    CategoryView(title: "Recent Actions", ActionItems: recentActions)
                    CustomDivider()
                    AllSettings()
                    
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
    var ActionItems: [ActionItem]
    
    var body: some View{
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(ActionItems, id: \.self ) { item in
                        ActionButton(item: item)
                        
                    }
                }
            }
        }
    }
}

struct ActionButton: View{
    var item: ActionItem
    
    var body: some View{
        VStack(alignment: .center){
            GeneralButton(icon: item.icon)
            Text(item.text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}


struct ActionItem : Hashable{
    var icon: String
    var text: String
    
    
}


let quickShortcuts: [ActionItem] = [
    ActionItem(icon: "bolt.fill", text: "Chargin"),
    ActionItem(icon: "fanblades.fill", text: "Fan On"),
    ActionItem(icon: "music.note", text: "Media Controls"),
    ActionItem(icon: "bolt.car", text: "Close Charge Port")
]

let recentActions: [ActionItem] = [
    ActionItem(icon: "arrow.up.square", text: "Open Trunk"),
    ActionItem(icon: "fanblades", text: "Fan Off"),
    ActionItem(icon: "person.fill.viewfinder", text: "Summon")
]

struct AllSettings : View {
    var body: some View{
        VStack{
            CategoryHeader(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(170)),GridItem(.fixed(170))]) {
                SettingBlock(icon: "car.fill", title: "Controlls", subtitle: "car locked")
                SettingBlock(icon:"fanblades.fill", title: "Climate", subtitle: "Interior 68??F")
                SettingBlock(icon: "location.fill", title: "Location", subtitle: "Empire State Building")
                SettingBlock(icon: "checkerboard.shield", title: "Security", subtitle: "0 Events detected")
                SettingBlock(icon: "sparkles", title: "Upgrades", subtitle: "3 upgrades available")
                
            }
        }
    }
}
    
struct SettingBlock: View{
        var icon: String
        var title: String
        var subtitle: String
        
        var backgroundColor: Color = Color.white.opacity(0.05)
        
        var body: some View{
            
            HStack(alignment: .center, spacing: 0){
                Image(systemName:icon)
                VStack(alignment: .leading, spacing: 2){
                    Text(title)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal:true,vertical:false)
                        .font(.system(size:16, weight: .medium,design: .default))
                    
                        Text(subtitle.uppercased())
                            .font(.system(size:8, weight: .medium,design: .default))
                            .frame( maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                           

                }
                .padding(.leading, 5)
                Spacer()
                Image(systemName: "chevron.right")
                
            }
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius:16))
            .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.white.opacity(0.1),
                lineWidth:0.5))

        }
    
}
    
    
