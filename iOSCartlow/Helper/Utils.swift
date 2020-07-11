//
//  CustomProfileAPIManager.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 07/11/2020.
//

import UIKit

class Utils{
    
    // MARK: Get string from dictionary using key
    static func getStringFromDict(key:String,dict:NSDictionary) ->String{
        if(dict.object(forKey: key) != nil){
            return dict.object(forKey: key) as! String
        }
        return ""
    }
}

