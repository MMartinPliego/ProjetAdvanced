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
    //let login: UserLoginDTO?
    let dob: UserDobDTO?
    let registered: UserRegisteredDTO?
    let cell: Int?
    let picture: UserPictureDTO?
    let nat: String?

}
