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


//Clousuer genérico
typealias ServiceCompletion = (_ results: UserDTO) -> ()


class ApiManager {
        // MARK: - Singleton declaration
    // solo inicia una clase
    static let shared = ApiManager()
    private init() {}
    
    private let numUsers: Int = 100
    
    // Función para el ApiManager nos devuelva con un Clousure los datos de la DB
    func fetchUsers(completion: ServiceCompletion) {
        // Llamar al servicio
        
        //Devolver datos
        completion(.success(data: "BIENNNN"))
        
    }
    
}
