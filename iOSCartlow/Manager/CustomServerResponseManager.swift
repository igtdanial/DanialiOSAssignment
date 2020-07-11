//
//  CustomServerResponseManager.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 11/07/2020.
//

import UIKit

class CustomServerResponseManager: NSObject {
    static let sharedInstance = CustomServerResponseManager()
    
    var arrayOfCategories:[CategoryModel] = []
    var arrayOfCatBanners:[BannerModel] = []
    var arrayOfBestDeals:[DealModel] = []
    var arrayOfBestDealBanners:[BannerModel] = []
    var arrayOfiPhoneDeals:[DealModel] = []
    var arrayOfBrands:[CategoryModel] = []
    var arrayOfBoxing:[DealModel] = []
    
    
    //MARK: Get Server Response
    func getServerResponse() {
        let url:String = Urls.SERVER_RESPONSE_URL
        let parameters:[String:String] = [:]
        NetworkManager.getServerResponse(url, parameters: parameters as [String:AnyObject], success: {(result1: NSDictionary) -> Void in
            self.arrayOfCategories.removeAll()
            self.arrayOfCatBanners.removeAll()
            self.arrayOfBestDeals.removeAll()
            self.arrayOfBestDealBanners.removeAll()
            self.arrayOfiPhoneDeals.removeAll()
            self.arrayOfBrands.removeAll()
            self.arrayOfBoxing.removeAll()
        
            if(result1.object(forKey: "responses") != nil){
                let result = result1.object(forKey: "responses") as! NSDictionary
                
                if(result.object(forKey: "categories") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "categories") as! [NSDictionary]
                    for obj in dictionaryArr{
                        let productItem:CategoryModel = CategoryModel()
                        self.arrayOfCategories.append(productItem.initWithDictionary(userdataResponse: obj))
                    }
                    print("\nMy Print")
                }
                if(result.object(forKey: "categoryBanners") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "categoryBanners") as! [NSDictionary]
                    for obj in dictionaryArr{
                        let productItem:BannerModel = BannerModel()
                        self.arrayOfCatBanners.append(productItem.initWithDictionary(userdataResponse: obj))
                    }
                    print("\nMy Print")
                }
                if(result.object(forKey: "bestDeals") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "bestDeals") as! [NSDictionary]
                    for obj in dictionaryArr{
                        let productItem:DealModel = DealModel()
                        self.arrayOfBestDeals.append(productItem.initWithDictionary(userdataResponse: obj))
                    }
                    print("\nMy Print")
                }
                if(result.object(forKey: "bestDealsBanners") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "bestDealsBanners") as! [NSDictionary]
                    for obj in dictionaryArr{
                        let productItem:BannerModel = BannerModel()
                        self.arrayOfBestDealBanners.append(productItem.initWithDictionary(userdataResponse: obj))
                    }
                    print("\nMy Print")
                }
                if(result.object(forKey: "iphoneDeals") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "iphoneDeals") as! [NSDictionary]
                       for obj in dictionaryArr{
                           let productItem:DealModel = DealModel()
                           self.arrayOfiPhoneDeals.append(productItem.initWithDictionary(userdataResponse: obj))
                       }
                       print("\nMy Print")
                }
               
                if(result.object(forKey: "brands") != nil){
                    let dictionaryArr:[NSDictionary] = result.object(forKey: "brands") as! [NSDictionary]
                    for obj in dictionaryArr{
                        let productItem:CategoryModel = CategoryModel()
                        self.arrayOfBrands.append(productItem.initWithDictionary(userdataResponse: obj))
                    }
                    print("\nMy Print")
                }
              if(result.object(forKey: "boxing") != nil){
                  let dictionaryArr:[NSDictionary] = result.object(forKey: "boxing") as! [NSDictionary]
                  for obj in dictionaryArr{
                      let productItem:DealModel = DealModel()
                      self.arrayOfBoxing.append(productItem.initWithDictionary(userdataResponse: obj))
                  }
              }
                
            }
           NotificationCenter.default.post(name: .onServerResponse, object: nil, userInfo:nil)
            
        } , failure: {(error: NSDictionary?) -> Void in
            print ("Api Failure : error is:\n \(String(describing: error))")
            NotificationCenter.default.post(name: .onServerResponse, object: nil, userInfo:nil)
        })
        
    }
 
    //MARK: For singleton pattern
    private override init() {
        super.init()
    }
}
