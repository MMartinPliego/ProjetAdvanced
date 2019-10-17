//
//  UserDetail.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 17/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import Foundation


class UserDetail {
    let id: String
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let birthdate: Date?
    let country: String?
    let nationality: String?
    let gender: String?
    let city: String?
    let street: String?
    let cell: Int?
    let timezone: String?
    
    
    init(id: String,
         avatar: String? = nil,
         firstName: String? = nil,
         lastname: String? = nil,
         email: String? = nil,
         birthdate: Date? = nil,
         country: String? = nil,
         nationality: String? = nil,
         city: String? = nil,
         street: String? = nil,
         gender: String? = nil,
         cell: Int? = nil,
         timezone: String? = nil) {
        
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastname
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
        self.city = city
        self.street = street
        self.gender = gender
        self.cell = cell
        self.timezone = timezone
    }
    
}
