//
//  User.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 08/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
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
    let gender: String?
    let city: String?
    let phone: String?
    let cell: String?
    let timezoneDescription: String?
    let timezoneOffset: String?
    let streetName: String?
    let streetNumber: String?
    
    var name: String {
        var userName = ""
        if let userFirstName = firstName {
              userName += userFirstName
              }
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? " \(userLastName)":
            userLastName)
        }
        
        return"\(userName)"
    }
    
    var timezone: String {
        var userTimezone = ""
        if let userTimezoneDescription = timezoneDescription {
            userTimezone += userTimezoneDescription
        }
        
        if let userTimezoneOffset = timezoneOffset {
            userTimezone += userTimezoneOffset
        }
        
        return "\(userTimezone)"
    }
    
    var street: String {
        var userStreet = ""
        if let userStreetName = streetName {
            userStreet += userStreetName
        }
        
        if let userStreetNumber = streetNumber {
            userStreet += userStreetNumber
        }
        
        return "\(userStreet)"
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
         nationality: String? = nil,
         city: String? = nil,
         gender: String? = nil,
         phone: String? = nil,
         cell: String? = nil,
         timezoneDescription: String? = nil,
         timezoneOffset: String? = nil,
         streetName: String? = nil,
         streetNumber: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastname
        self.email = email
        self.birthdate = birthdate
        self.country = country
        self.nationality = nationality
        self.city = city
        self.gender = gender
        self.phone = phone
        self.cell = cell
        self.timezoneDescription = timezoneDescription
        self.timezoneOffset = timezoneOffset
        self.streetName = streetName
        self.streetNumber = streetNumber
    }
    
}
