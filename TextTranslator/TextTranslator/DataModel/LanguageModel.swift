//
//  File.swift
//  TextTranslator
//
//  Created by Haris Mehmood on 26/06/2024.
//

import Foundation
import SwiftUI
import Combine

struct Language: Codable, Identifiable{
    let id = UUID()
    let language: String
    let language_code: String
}

struct TranslationResponse:Codable{
    let id:String
    let from:String
    let to:String
    let input:[String]
    let translation:[String]
}
