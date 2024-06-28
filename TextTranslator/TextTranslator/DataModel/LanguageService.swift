//
//  FetchLanguages.swift
//  TextTranslator
//
//  Created by Haris Mehmood on 26/06/2024.
//

import Foundation
import Combine

class LanguageService: ObservableObject{
    @Published var languages: [Language]=[]
    private let apiHubHost:String = "Translate.allthingsdev.co"
    private let apiHub: String="wf7dAn9EXrFBpbWeMl3JVb2HCiYUWHxP5enElAQXvHzZBizYxD"
    @Published var translationResult: String = ""
    let networkManager = NetworkManager()
    
    init(){
        fetchLanguages()
//        translate(input_text: "My name is Haris Mehmood", translated_from: "eng", translated_to: "ger")
//        translate(input_text: "Thank You!", translated_from: "eng", translated_to: "ger")
//        translate(input_text: "How are you", translated_from: "eng", translated_to: "fra")
//        translate(input_text: "whats going on", translated_from: "eng", translated_to: "ita")
//        translate(input_text: "Bye, Take Care", translated_from: "eng", translated_to: "spa")
//        translate(input_text: "I am going to school", translated_from: "eng", translated_to: "dan")
    }
    func fetchLanguages(){
        guard let url = URL(string:"https://translate.proxy-production.allthingsdev.co/languages") else { return }
        var request = URLRequest(url: url)
        request.addValue(apiHubHost, forHTTPHeaderField: "X-Apihub-Host")
        request.addValue(apiHub, forHTTPHeaderField: "X-Apihub-Key")
        
        networkManager.createRequest(request: request){
            d , e  in
            if let err = e {
                print("\(err)")
            }
            if let data = d {
                do {
                    let lang =  try JSONDecoder().decode([Language].self, from: data)
                    self.languages = lang
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
            
        }
    }
    
    func translate(input_text:String ,translated_from:String, translated_to:String){
        let baseURL = "https://Translate.proxy-production.allthingsdev.co/translate"
        var urlComponents = URLComponents(string: baseURL)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "translated_from", value: translated_from),
            URLQueryItem(name: "translated_to", value: translated_to)
        ]
        
        guard let url = urlComponents?.url else { return }
        
        var request = URLRequest(url: url)
        request.addValue(apiHubHost, forHTTPHeaderField: "X-Apihub-Host")
        request.addValue(apiHub, forHTTPHeaderField: "X-Apihub-Key")
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: String] = ["input": input_text]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
                
            } catch {
                print("Error encoding JSON body: \(error)")
                return
            }
        
        networkManager.createRequest(request: request) { d ,e in
            if let err = e {
                print ("\(err)")
            }
            if let data = d {
               do {
                   let output = try JSONDecoder().decode(TranslationResponse.self, from: data)
                   self.translationResult = output.translation.joined(separator: " ")
                   print (self.translationResult)
               } catch {
                   print("Error decoding JSON: \(error)")
               }
            }
            else {
                print("No data fetched")
            }
            
        }
    }
}
