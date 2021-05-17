//
//  User.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var email: String = ""
    let finances = List<UserFinances>()
}
