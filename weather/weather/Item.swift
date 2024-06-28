//
//  Item.swift
//  weather
//
//  Created by Haris Mehmood on 25/06/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
