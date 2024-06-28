//
//  ContentView.swift
//  weather
//
//  Created by Haris Mehmood on 25/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let dummyData = [
        DisplayWeather(day: "Mon", isRainy: false, minTemp: 30, maxTemp: 53),
        DisplayWeather(day: "Tue", isRainy: false, minTemp: 30, maxTemp: 53),
        DisplayWeather(day: "Wed", isRainy: true, minTemp: 25, maxTemp: 38),
        DisplayWeather(day: "Thurs", isRainy: false, minTemp: 30, maxTemp: 53),
        DisplayWeather(day: "Fri", isRainy: false, minTemp: 30, maxTemp: 53),
        DisplayWeather(day: "Sat", isRainy: true, minTemp: 25, maxTemp: 38),
        DisplayWeather(day: "Sun", isRainy: true, minTemp: 25, maxTemp: 38)
            // Add more days as needed
        ]
    @State private var isVertical: Bool = true
    @State private var scrollType: String = "Vertical Scroll"

    var body: some View {
        
        
        VStack(spacing:8){
            Toggle(isOn: $isVertical) {
                Text(scrollType).font(.system(size: 16))
            }.padding()
            GeometryReader{geometry in
                if(!isVertical){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 12){
                            ForEach(dummyData, id:\.day){item in
                                var iColor: Color{
                                    if item.isRainy{
                                        return Color.blue}
                                    else{
                                        return Color.yellow}
                                }
                                var image: String{
                                    if item.isRainy{
                                        return "cloud.rain.fill"
                                    }
                                    else{
                                        return "sun.max.fill"
                                    }
                                }
                                VStack{
                                    Text(item.day).font(.system(size: 24))
                                    Image(systemName:image).padding(.vertical,2)
                                        .font(.system(size: 24))
                                        .foregroundColor(iColor)
                                    Text("High: \(item.maxTemp)").font(.subheadline)
                                    Text("Low:\(item.minTemp)").font(.subheadline)
                                }.padding(.horizontal,24).padding(.vertical,12).background(Color(red: 222/255.0, green: 222/255.0, blue: 222/255.0)).cornerRadius(18)
                                
                            }
                        }.padding(12)
                    }
                }
                else{
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing: 12){
                            ForEach(dummyData, id:\.day){item in
                                var iColor: Color{
                                    if item.isRainy{
                                        return Color.blue}
                                    else{
                                        return Color.yellow}
                                }
                                var image: String{
                                    if item.isRainy{
                                        return "cloud.rain.fill"
                                    }
                                    else{
                                        return "sun.max.fill"
                                    }
                                }
                                VStack{
                                    Text(item.day).font(.system(size: 24))
                                    Image(systemName:image).padding(.vertical,2)
                                        .font(.system(size: 24))
                                        .foregroundColor(iColor)
                                    Text("High: \(item.maxTemp)").font(.subheadline)
                                    Text("Low:\(item.minTemp)").font(.subheadline)
                                }.frame(width: geometry.size.width * 0.8).padding(.horizontal,24).padding(.vertical,12).background(Color(red: 222/255.0, green: 222/255.0, blue: 222/255.0)).cornerRadius(36)
                                
                            }
                        }.padding(12)
                    }
                }}
            
        }
        
    }

    
}

struct DisplayWeather{
    let day:String
    let isRainy: Bool
    let minTemp: Int
    let maxTemp: Int

}


#Preview {
    ContentView()}
