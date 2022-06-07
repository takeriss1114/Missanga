//
//  Person.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/24.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit

class Person {
    var objectId: String
    var name: String?
    var age: String?
    var area: String?
    var contact: String?
    var occupation: String?
    var height: String?
    var body: String?
    var sake: String?
    var tobacco: String?
    var pias: String?
    var personal: String?
    var hobby: String?
    var art: String?
    var sex: String?
    var comment: String?
    
    init(objectId: String, name: String?, age: String?, area: String?, contact: String?, occupation: String?, height: String?, body: String?, sake: String?, tobacco: String?, pias: String?, personal: String?, hobby: String?, art: String?, sex: String?, comment: String?) {
        self.objectId = objectId
        self.name = name
        self.age = age
        self.area = area
        self.contact = contact
        self.occupation = occupation
        self.height = height
        self.body = body
        self.sake = sake
        self.tobacco = tobacco
        self.pias = pias
        self.personal = personal
        self.hobby = hobby
        self.art = art
        self.sex = sex
        self.comment = comment
    }
}
