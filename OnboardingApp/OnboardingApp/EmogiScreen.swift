//
//  EmogiScreen.swift
//  OnboardingApp
//
//  Created by Haris Mehmood on 28/06/2024.
//

import SwiftUI

struct EmogiScreen: View {
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    @State var selectedEmoji : String?
    
    init() {
        self.selectedEmoji = emojis.first
        }
    
    var body: some View {
        VStack(){
                
            Text("Whats your mood?").foregroundColor(.brown).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding(.bottom)
           
            HStack{
                ForEach(emojis, id:\.self){ item in
                    Button(action: {
                        selectedEmoji = item
                    }, label: {
                        VStack{
                            Text(item).font(.system(size:40)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center).padding(.bottom)
                            Image(systemName: selectedEmoji == item ? "circle.fill" : "circle").font(.system(size: 20))
                        }
                    })
                    
                }
            }
        }.padding()
    }
}

#Preview {
    
    EmogiScreen()
}
