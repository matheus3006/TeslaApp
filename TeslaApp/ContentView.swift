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
                VStack{
                    HomeHeader()
                        CustomDivider()
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
                GeneralButton(icon: "lock.fill")
                GeneralButton(icon: "gear")
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
            .frame(height:0.5)
            .background(Color.white)
            .opacity(0.1)
    }
}
