//
//  ContentView.swift
//  ContactList
//
//  Created by Haris Mehmood on 01/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Haris", "Ramzan", "Hannan", "Usman" ]
    @State private var nameToAdd = ""
    @State private var selectedPickName = "Haris"
    
    var body: some View {
       
        VStack{
            Text(selectedPickName.isEmpty ? " " : selectedPickName)
            List {
                ForEach(names, id: \.self ) { name in
                Text (name)
                }
            }
            
            TextField ("Add Name", text:$nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd=""
                    }
                }
            
            Button("Pick Random Name") {
                if let pickedname = names.randomElement() {
                    selectedPickName = pickedname
                }
                else { selectedPickName = " "}
            }
        }.padding()
    }
}


#Preview {
    ContentView()
}
