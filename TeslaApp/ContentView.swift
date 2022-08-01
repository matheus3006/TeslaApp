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
