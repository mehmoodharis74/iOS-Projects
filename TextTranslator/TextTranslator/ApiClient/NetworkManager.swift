//
//  NetworkManager.swift
//  TextTranslator
//
//  Created by Haris Mehmood on 26/06/2024.
//

import Foundation

class NetworkManager {
    func createRequest(request:URLRequest, completion: @escaping (Data?,Error?)->Void){
        
        URLSession.shared.dataTask(with: request){ data,response,error in
            if let error = error{
               completion(nil,error)
            }
            completion(data,nil)
        }.resume()
        
    }
}
