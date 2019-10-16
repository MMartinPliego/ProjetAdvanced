//
//  LocationDTO.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 04/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import Foundation

struct LocationDTO: Codable {
    let city: String?
    let state: String?
    let coordinates: CoordinatesDTO?
    
    // ¿Service Error?
    let street: StreetDTO?
    // let postcode: String?
    let country: String?
    let timezone: TimezoneDTO?
}

