//
//  Category.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 08/07/2020.
//

import UIKit

class CategoryModel: NSObject {
    var id:String = ""
    var image:String = ""
    var name:String = ""
    var priority:String = ""
    var status:String = ""
    override init() {
        id = ""
        image = ""
        name = ""
        priority = ""
        status = ""
    }

    func initWithDictionary(userdataResponse:NSDictionary) -> CategoryModel {
        self.id = Utils.getStringFromDict(key: "id",dict: userdataResponse)
        self.image = Utils.getStringFromDict(key: "image",dict: userdataResponse)
        self.name = Utils.getStringFromDict(key: "name",dict: userdataResponse)
        self.priority = Utils.getStringFromDict(key: "priority",dict: userdataResponse)
        self.status = Utils.getStringFromDict(key: "status",dict: userdataResponse)
        return self
    }
}
