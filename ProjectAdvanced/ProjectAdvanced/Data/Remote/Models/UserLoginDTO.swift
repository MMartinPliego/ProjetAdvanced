//
//  UserLoginDTO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

struct UserLoginDTO: Codable {
    
    let uuid: String?
    let userName: String?
    let passwprd: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
}
