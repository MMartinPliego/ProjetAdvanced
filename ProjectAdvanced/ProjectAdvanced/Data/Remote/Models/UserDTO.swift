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
    let name: NameDTO?
    let location: LocationDTO?
    let email: String?
    let dob: DobDTO?
    let registered: RegisteredDTO?
    let cell: Int?
    let picture: PictureDTO?
    let nat: String?
    
    //let login: LoginDTO?

}
