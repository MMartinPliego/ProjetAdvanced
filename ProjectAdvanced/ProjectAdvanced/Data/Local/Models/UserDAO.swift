//
//  UserDAO.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation
import RealmSwift

class UserDAO: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var avatar: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var gender: String?
    @objc dynamic var country: String?
    @objc dynamic var email: String?
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?
    @objc dynamic var birthdate: Date?

    override class func primaryKey() -> String? {
        return "uuid"
    }

}
