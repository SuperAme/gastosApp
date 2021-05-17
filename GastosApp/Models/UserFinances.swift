//
//  UserFinances.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import Foundation
import RealmSwift

class UserFinances: Object {
    @objc dynamic var ingresos: Float = 0.0
    @objc dynamic var gastos: Float = 0.0
    @objc dynamic var total: Float = 0.0
    var parentObject = LinkingObjects(fromType: User.self, property: "finances")
}
