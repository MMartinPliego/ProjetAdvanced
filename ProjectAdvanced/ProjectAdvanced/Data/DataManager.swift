//
//  DataManager.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//


import Foundation

class DataManager {
    // MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    
    func users(completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let users = self?.usersFromUsersDB(), users.count > 0 {
                // devolver userDB
                DispatchQueue.main.async {
                    completion(.success(data: users))
                }
            }
            else {
                // llamar al servicio y guardar usuarios
                // en base de datos
                self?.usersForceUpdate(completion: completion)
            }
        }
    }
    
    func usersForceUpdate(completion: @escaping ServiceCompletion) {
        // Llamar al servicio para obtener nuevos usuarios
        DispatchQueue.global(qos: .background).async {
            ApiManager.shared.fetchUsers() { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let usersDTO = data as? UsersDTO else {
                            DispatchQueue.main.async {
                                completion(.failure(msg: "Mensaje error genérico"))
                            }
                            return
                        }
                        
                        // Eliminar todos los usuarios de la base de datos
                        DatabaseManager.shared.deleteAll()
                        // Guardar usuarios en la base de datos
                        self?.save(users: usersDTO)
                        // Cargar usuarios almacenados en la base de datos
                        let users = self?.usersFromUsersDB()
                        
                        DispatchQueue.main.async {
                            completion(.success(data: users))
                        }
                    
                    case .failure(let msg):
                        print("Fallo al obtener usuarios del servicio: \(msg)")
                    
                        DispatchQueue.main.async {
                            completion(.failure(msg: msg))
                        }
                }
            }
        }
    }
    
    func user(by id: String, completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let userDAO = DatabaseManager.shared.user(by: id) {
                let user = self?.user(from: userDAO)
                
                DispatchQueue.main.async {
                    completion(.success(data: user))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(msg: "No se ha encontrado el usuario"))
                }
            }
        }
    }
    
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
    }
    
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
            return
        }
        
        usersToSave.forEach{ save(user: $0) }
    }
    
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
                             longitude: user.location?.coordinates?.longitude,
                             nationality: user.nat)
        
        DatabaseManager.shared.save(user: userDB)
    }
    
    private func usersFromUsersDB() -> Array<User> {
        let usersDAO = usersDB()
        // Convertir listado de UserDAO a listado de User
        return users(from: usersDAO)
    }
    
    
    private func users(from usersDAO: Array<UserDAO>) -> Array<User> {
        return usersDAO.compactMap { userDAO in
            return self.user(from: userDAO)
        }
    }
    
    private func user(from userDAO: UserDAO) -> User {
        return User(id: userDAO.uuid,
                    avatar: userDAO.avatar,
                    firstName: userDAO.firstName,
                    lastname: userDAO.lastName,
                    email: userDAO.email,
                    birthdate: userDAO.birthdate,
                    country: userDAO.country,
                    nationality: userDAO.nationality)
    }
}








/*
class DataManager {
    
    //MARK: - Singleton declaration
    static let shared = DataManager()
    private init() {}
    
    func users(completion: @escaping ServiceCompletion) {
        // DispatchQueue.global para ejecutar hilos en una llamada que no sea main y explote la app
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let users = self?.usersDB(), users.count > 0 {
                
                let userGuard = users.compactMap { userDAO in
                    return self?.convertUser(from: userDAO)
                }
                
                //devolver userDB
                DispatchQueue.main.async {
                    completion(.success(data: userGuard))
                }
            }
            else {
                //llamar al servicio y guardar usarios en la base de datos
                self?.usersForceUpdate(completion: completion)
            }
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
                        DispatchQueue.main.async {
                            completion(.failure(msg:"Mensaje error generico"))
                        }
                        return
                    }
                    
                    // Eliminar todos los usuarios de la base de datos
                    DatabaseManager.shared.deleteAll()
                    //guardar los nuevos usuarios
                    self?.save(users: users)
                    
                    // ejecutar en el hilo main
                    DispatchQueue.main.async {
                        completion(.success(data: users))
                    }
                   
                case .failure(let msg):
                    print("Fallo al obtener usuarios del Servicio: \(msg)")
                    
                    // ejecutar en el hilo main
                    DispatchQueue.main.async {
                        completion(.failure (msg: msg))
                    }
                }
            }
        }
    }
    
    //Buscar usuario por la base de datos
    func user(by id: String, completion: @escaping ServiceCompletion){
        DispatchQueue.global(qos: .background).async { [weak self] in
    
            if let userDAO = DatabaseManager.shared.user(by: id) {
                let user = self?.convertUser(from: userDAO)

                    DispatchQueue.main.async {
                        completion(.success(data: user))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(msg: "No se ha encontrado al usuario"))
                }
            }
        }
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
                             longitude: user.location?.coordinates?.longitude,
                             nationality: user.nat)

        
        DatabaseManager.shared.save(user: userDB)
        
    }
    
    private func convertUser(from userDAO: UserDAO) -> User {
        return  User(id: userDAO.uuid,
                     avatar: userDAO.avatar,
                     firstName: userDAO.firstName,
                     lastname: userDAO.lastName,
                     email: userDAO.email,
                     birthdate: userDAO.birthdate,
                     country: userDAO.country,
                     nationality: userDAO.nationality)
    }
    
    private func funusersFromUserDB() -> Array <User> {
        let userDAO = userDB()
        //Convertir listado de USerDAO a listado User
        return users(from: userDAO)
    }
    
    private func users (from userDAO: Array<UserDAO>) -> Array<User> {
        return usersDAO.compactMap { userDAO in
            return self.user(from: userDAO)
        }
    }
    
}
*/
