//
//  FeaturesScreen.swift
//  OnboardingApp
//
//  Created by Haris Mehmood on 28/06/2024.
//

import SwiftUI

struct FeaturesScreen: View {
    
    let image:String
    let text:String
    
    var body: some View {
        VStack{
            Text("Features").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            HStack(){
                Image(systemName: image).font(.largeTitle)
                Spacer()
                Text(text)
            }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(.accent).cornerRadius(12).foregroundColor(.white)
            Spacer()
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding()
        
    }
}

#Preview {
    FeaturesScreen(image:"person.2.crop.square.stack.fill",text: "A multiline description about a feature paired with the image on the left.")
}
