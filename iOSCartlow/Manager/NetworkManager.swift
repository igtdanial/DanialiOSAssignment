//
//  NetworkManager.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 07/11/2020.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager: NSObject {
    typealias apiSuccess = (_ result: NSDictionary) -> Void
    typealias apiFailure = (_ error: NSDictionary?) -> Void
  
    
    class func getServerResponse(_ strURL: String, parameters: [String: AnyObject], success:@escaping apiSuccess, failure:@escaping apiFailure) {
        
        Alamofire.request(strURL,method: .get, parameters: parameters).responseJSON { (responseObject) -> Void in
            print("\nmakeGetCall:\n\(responseObject)")
            
            if responseObject.result.isSuccess {
                let JSON = responseObject.result.value as? NSDictionary
                if (JSON != nil) {
                    success(JSON!)
                }
                else {
                    failure(["error":"API Format Error", "statusCode":999])
                }
            }
            if responseObject.result.isFailure {
                let httpError: NSError = responseObject.result.error! as NSError
                let statusCode = httpError.code
                let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                failure(error)
            }
        }
    }

}
