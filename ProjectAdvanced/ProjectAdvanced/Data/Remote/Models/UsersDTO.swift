//
//  UsersDTO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

struct UsersDTO: Codable {
    let users: Array<UserDTO?>
    let info: InfoDTO?
    
    private enum CodingKeys: String, CodingKey {
        case users = "results"
        case info
    }
}

