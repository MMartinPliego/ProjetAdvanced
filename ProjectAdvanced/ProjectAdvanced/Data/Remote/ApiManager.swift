//
//  ApiManager.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceResult {
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    private let url_users = "https://randomuser.me/api/"
    private let serviceKeyResults: String = "results"
    private let serviceResultCount: Int = 50
    private let serviceResultDateFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    private var testLoadUsersJson: UsersDTO? {
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
                print("parse error: \(error.localizedDescription)")
                return nil
            }
        }
        else {
            print("Invalid filename/path.")
            return nil
        }
    }
    
    // Llamar al servicio
    func fetchUsers(completion: @escaping ServiceCompletion) {
        Alamofire.request(url_users,
                          method: .get,
                          parameters: [serviceKeyResults: serviceResultCount],
                          encoding: URLEncoding.queryString) .response { [weak self] response in
                if let responseData = response.data {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = self?.serviceResultDateFormat
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    let users: UsersDTO? = try? decoder.decode(UsersDTO.self, from: responseData)
                    completion(.success(data: users))
                }
                else {
                    completion(.failure(msg: "Error"))
                    
                }
                            
        }
        
    }
    
}


/*
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

*/
