//
//  LoginDTO.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 04/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import Foundation

struct LoginDTO: Codable {
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
}
