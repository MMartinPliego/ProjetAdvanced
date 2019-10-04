//
//  InfoDTO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

struct InfoDTO: Codable {
    let seed: String?
    let count: Int?
    let page: Int?
    let version: String?
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case count
        case page
        case version = "results"
    }
    
}
