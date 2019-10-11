//
//  User.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 08/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

class User {
    let id: String
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let birthdate: Date?
    let country: String?
    let nationality: String?
    
    var name: String {
        var userName = ""
        if let userFirstName = firstName {
              userName += userFirstName
              }
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? "\(userLastName)":
            userLastName)
        }
        
        return"\(userName)"
    }
    
    // Devolver los años de los usuarios
    var age: Int {
        // con esto aseguro me pasa una fecha y si no me la pasa devuelvo 0
        guard let date = birthdate else {
            return 0
        }
        
        let ageComponents = Calendar.current.dateComponents([.year],
                                                    from: date, to: Date())
        
        return ageComponents.year ?? 0
    }

    
    init(id: String,
         avatar: String? = nil,
         firstName: String? = nil,
         lastname: String? = nil,
         email: String? = nil,
         birthdate: Date? = nil,
         country: String? = nil,
         nationality: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastname
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
    }
    
}
