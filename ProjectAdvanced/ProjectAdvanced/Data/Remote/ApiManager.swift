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
   static let shared = ApiManager()
   private init(){}
    
   private let numUsers: Int = 100
    
   func fetchUsers(completion: ServiceCompletion) {
       //Llamar al servicio
       if let users = readJSONFromFile() {
           //Devolver datos
           completion(.success(data: users))
       } else {
           completion(.failure(msg: "No se han podido cargar los usuarios"))
       }
   }
    
   func readJSONFromFile() -> UsersDTO?{
       // Llamar al servicio
       if let path = Bundle.main.path(forResource: "users", ofType: "json") {
           do {
               let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            
               let decoder = JSONDecoder()
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
               decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
               return try decoder.decode(UsersDTO.self, from: jsonData)
           }
            
           catch let error {
               print("parse Error: \(error.localizedDescription)")
               return nil
           }
       }
        
       else {
           print("Invalid filename/path.")
           return nil
       }
    
   }
    
}


