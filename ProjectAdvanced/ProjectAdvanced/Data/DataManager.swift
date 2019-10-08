//
//  DataManager.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

class DataManager {
    
    //MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    func users(completion: @escaping ServiceCompletion) {
        let users = usersDB()
        if usersDB().count > 0 {
            //devolver userDB
            completion(.success(data: users))
        }
        else{
            //llamar al servicio y guardar usarios en la base de datos
            usersForceUpdate(completion: completion)
        }
    }
    
    //llamar al servicio y guardar usarios en la base de datos
    func usersForceUpdate(completion: @escaping ServiceCompletion) {
        
        //Hacer un hilo para ejecutar la llamada en segundo plano
        DispatchQueue.global(qos: .background).async {
            ApiManager.shared.fetchUsers() { [weak self] result in
                switch result {
                case .success(let data):
                    guard let users = data as? UsersDTO else {
                        completion(.failure(msg:"Mensaje error generico"))
                        return
                    }
                    // Eliminar todos los usuarios de la base de datos
                    DatabaseManager.shared.deleteAll()
                    //guardar los nuevos usuarios
                    save(users: users)
                    completion(.success(data: users))
                    
                case .failure(let msg):
                    print("Fallo al obtener usuarios del Servicio: \(msg)")
                    completion(.failure (msg: msg))
                }
            }
        }
    }
    
    func user(by id: String) -> UserDAO? {
        return DatabaseManager.shared.user(by: id)
    }
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
    }
    
    // Guardar usuarios en la DB
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
           return
        }
        usersToSave.forEach{ save(user: $0) }
    }
    
    // Convertir UserDTO a UserDAO
    private func save(user: UserDTO) {
        guard let userId = user.login?.uuid else {
            return
        }
        
        let userDB = UserDAO(uuid: userId,
                             avatar: user.picture?.large,
                             firstName: user.name?.first,
                             lastName: user.name?.last,
                             email: user.email,
                             gender: user.gender,
                             birthdate: user.dob?.date,
                             country: user.location?.country,
                             latitude: user.location?.coordinates?.latitude,
                             longitude: user.location?.coordinates?.longitude)
        
        DatabaseManager.shared.save(user: userDB)
    }
}



/*
class DataManager {
    // MARK: - Singleton declaration
    // solo inicia una clase
    static let shared = DataManager()
    private init() {}

    
    //Obtener usuarios
    func users(completion: ServiceCompletion) {
        let users = usersDB()
        if users.count > 0 {
            // devolver userDB
            completion(.success(data: users))
        }
        else {
            //llamar al servicio y guardar los datos
            userForceUpdate(completion: completion)
        }
    }
    

    func userForceUpdate(completion: ServiceCompletion) {
        //Llamar al servicio para obtener nuevos usuarios
        ApiManager.shared.fetchUsers() { result in
        switch result {
            case .success(let data):
                guard let users = data as? UserDTO else {
                    completion(.failure(msg: "Mensaje error genérico"))
                    return
            }
            
            // Limpiar la base de datos de todos los usuarios
            DatabaseManager.shared.deleteAll()
            // Guardar los nuevos usuarios
            save(users: users)
                completion(.success(data: users))
            
        case .failure(let msg):
                print("Fallo al obtener users \(msg)")
                completion(.failure(msg: msg))
            }
        }
    }
    
    func user(by id: String) -> UserDAO {
        return DatabaseManager.shared.user(by: id)
    }
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
    }
    
    // Guardar usuarios en la DB
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
            
        }
        usersToSave.forEach{ save(user: $0) }
    }
    
    // Convertir UserDTO a UserDAO
    private func save(user: UserDTO) {
        guard let userId = user.login?.uuid else {
            return
        }
        
        let userDB = UserDAO(uuid: userId,
                avatar: user.picture?.large,
                firsName: user.name?.first,
                lastName: user.name?.last,
                email: user.email,
                gender: user.dob?.dateDob,
                birthdate: user.nat,
                country: user.location?.country,
                latitude: location?.coordinates?.Latitude,
                longitude: location?.coordinates?.longitude)
        
        DatabaseManager.shared.save(user: userDB)
    }
        
}
 /**/*/
