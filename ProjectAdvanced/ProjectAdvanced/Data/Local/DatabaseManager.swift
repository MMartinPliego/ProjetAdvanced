//
//  DatabaseManager.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    // MARK: - Singleton declaration
    // solo inicia una clase
    static let shared = DatabaseManager()
    private init() {}
    
    // MARK: - Properties
    //Get the default Realm Database
    private let realm = try! Realm()
    
    // MARK: - Function DB
    // Para escribir en la base de datos un UserDAO
    func save(user: UserDAO) {
        try! realm.write {
            realm.add(user,
                      update: .modified)
        }
    }
    
    // Para mostrar los resultados de la base de datos
    func users() ->Results<UserDAO> {
        return realm.objects(UserDAO.self)
    }
    
    //Buscar objetos por nombre y muestra lo que le pedimos
    func user(by id: String) -> UserDAO? {
        return realm.object(ofType: UserDAO.self,
                            forPrimaryKey: id)
    }
    
    // Borrar la base de datos entera
    func deleteAll() {
        try! realm.write {
        realm.deleteAll()
        }
    }
    
    //Eliminar un usuario de la DB
    func delete(user: UserDAO) {
        try! realm.write {
        realm.delete(user)
        }
    }
    
}
