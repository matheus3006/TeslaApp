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
                HomeHeader()
                .padding()
            }
            VoiceCommandButton()
        }
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
                        .background(Color.green)
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
                    .background(Color.red)
                    .clipShape(Capsule())
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack{
                
            }
        }
    }
        
        
}
