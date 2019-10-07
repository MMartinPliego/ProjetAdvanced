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
    // solo inicia una clase
    static let shared = DataManager()
    private init() {}

    
    //Obtener usuarios
    func users() {
        if usersDB().count > 0 {
            
        }
        else {
            
        }
    }
    

    func userForceUptade() {
        //Llamar al servicio para obtener nuevos usuarios
        ApiManager.shared.fetchUsers() { result in
        switch result {
            case .success(let data):
                guard let users = data as? UserDTO else {
                    return
            }
            
            // Limpiar la base de datos de todos los usuarios
            DatabaseManager.shared.deleteAll()
            // Guardar los nuevos usuarios
            save(users: users)
            
        case .failure(let msg):
                print("Fallo al obtener users \(msg)")
            }
        }
    }
    
    func user(id: String) -> UserDAO {
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
