//
//  Category.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 08/07/2020.
//

import UIKit

class DealModel: NSObject {
    var id:String = ""
    var image:String = ""
    var name:String = ""
    var desc:String = ""
    var price:String = "0"
    var retail_price:String = "0"
    var priority:String = ""
    var status:String = ""
    override init() {
        id = ""
        image = ""
        name = ""
        desc = ""
        price = "0"
        retail_price = "0"
        priority = ""
        status = ""
    }

    func initWithDictionary(userdataResponse:NSDictionary) -> DealModel {
        self.id = Utils.getStringFromDict(key: "id",dict: userdataResponse)
        self.image = Utils.getStringFromDict(key: "image",dict: userdataResponse)
        self.name = Utils.getStringFromDict(key: "name",dict: userdataResponse)
        self.desc = Utils.getStringFromDict(key: "description",dict: userdataResponse)
        self.price = Utils.getStringFromDict(key: "price",dict: userdataResponse)
        self.retail_price = Utils.getStringFromDict(key: "retail_price",dict: userdataResponse)
        self.priority = Utils.getStringFromDict(key: "priority",dict: userdataResponse)
        self.status = Utils.getStringFromDict(key: "status",dict: userdataResponse)
        return self
    }
}
