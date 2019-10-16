//
//  InfoDTO.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 04/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import Foundation

struct InfoDTO: Codable {
    let seed: String?
    let page: Int?
    let count: Int?
    let version: String?
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case page
        case version
        case count = "reults"
    }
    
}
