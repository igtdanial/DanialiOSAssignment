//
//  Category.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 08/07/2020.
//

import UIKit

class BannerModel: NSObject {
    var id:String = ""
    var image:String = ""
    var link_id:String = ""
    var priority:String = ""
    var status:String = ""
    override init() {
        id = ""
        image = ""
        link_id = ""
        priority = ""
        status = ""
    }

    func initWithDictionary(userdataResponse:NSDictionary) -> BannerModel {
        self.id = Utils.getStringFromDict(key: "id",dict: userdataResponse)
        self.image = Utils.getStringFromDict(key: "image",dict: userdataResponse)
        self.link_id = Utils.getStringFromDict(key: "link_id",dict: userdataResponse)
        self.priority = Utils.getStringFromDict(key: "priority",dict: userdataResponse)
        self.status = Utils.getStringFromDict(key: "status",dict: userdataResponse)
        return self
    }
}
