//
//  ApiManager.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

enum ServiceResult {
    
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()

class ApiManager {
    //MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    private let numUsers: Int = 100
        
    
    func fetchUsers(completion: ServiceCompletion) {
        // Llamar al servicio
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let codingData = try decoder.decode(UserDTO.self, from: data)
        let user = codingData.user
        

        
        
        
    }
}

/*
 
 func readJSONFromFile (fileName: String) -> Any? {
     let json: UserDAO?
     if let path = Bundle.main.path (forResource: fileName, ofType: "json") {
         do {
             let fileUrl = URL (fileURLWithPath: path)
             
             //Devolver datos
             completion(.success(data: aqui la private func))
         }
     }
 }
 
 
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let codingData = try decoder.decode(UserDTO.self, from: data)
let user = codingData.user

 
let decoderJson = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let userDAO = try decoder.decode(UserDTO.self, from: jsonData)

 
func decoderJson() {
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let viewJson = try decoder.decode(Decodable.Protocol, from: )
 }
 
 /**/*/
