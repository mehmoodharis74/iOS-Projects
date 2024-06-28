//
//  ContentView.swift
//  OnboardingApp
//
//  Created by Haris Mehmood on 28/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            WelcomeScreen()
            FeaturesScreen(image:"person.2.crop.square.stack.fill",text: "A multiline description about a feature paired with the image on the left.")
            EmogiScreen()
        }.tabViewStyle(.page)
        
    }
}

#Preview {
    ContentView()
}
