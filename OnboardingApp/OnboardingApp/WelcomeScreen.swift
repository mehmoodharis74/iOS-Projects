//
//  WelcomeScreen.swift
//  OnboardingApp
//
//  Created by Haris Mehmood on 28/06/2024.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 20).frame(width: 100,height: 100).foregroundStyle(.tint)
                Image(systemName:"figure.2.and.child.holdinghands").foregroundColor(.white).font(.system(size: 50))
            }
            VStack {
                Text("Welcome Screen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top)
                
                Text("This is my App").font(.title3)
            }
        }
        
    }
}

#Preview {
    WelcomeScreen()
}
