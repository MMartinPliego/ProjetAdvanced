//
//  UserDTO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

struct UserDTO: Codable {
    
    let gender: String?
    let name: UserNameDTO?
    let location: UserLocationDTO?
    let email: String?
    // let userLoginDTO: String?
    let userDobDTO: String?
    let userRegiteredDTO: String?
    let cell: Int?
    // let userIdDTO: Int?
    let userPictureDTO: UserPictureDTO?
    let nat: String?

}
