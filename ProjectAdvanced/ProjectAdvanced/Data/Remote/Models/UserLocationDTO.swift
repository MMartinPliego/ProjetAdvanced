//
//  UserLocationDTO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

struct UserLocationDTO: Codable {
    let street: UserStreetDTO?
    let city: String?
    let state: String?
    let postcode: String?
    let country: String?
    let timezone: UserTimezonaDTO?
    let coordinates: UserCoordinatesDTO?
    
    
}

