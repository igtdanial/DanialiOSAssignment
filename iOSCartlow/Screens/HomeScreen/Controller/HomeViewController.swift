//
//  HomeViewController.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 06/07/2020.
//

import UIKit

class HomeViewController: UIViewController {

    let APP_COLOR:UIColor = UIColor.init(red: 102/255.0, green: 178/255.0, blue: 88/255.0, alpha: 1.0)
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchContainer: UIView!
    
    var sectionList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSearchUI()
        configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(onServerResponse), name: .onServerResponse, object: nil)
       
    }
   
    func configureTableView(){
         self.tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
        self.tableView.register(UINib(nibName: "BrandTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandTableViewCell")
        self.tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCustomTableViewCell")
        self.tableView.separatorStyle = .none
    }
    
    func populateDataSet(){
        if(CustomServerResponseManager.sharedInstance.arrayOfCategories.count > 0){
            sectionList.append("categories")
        }
        if(CustomServerResponseManager.sharedInstance.arrayOfCatBanners.count > 0){
            sectionList.append("categories_banners")
        }
        if(CustomServerResponseManager.sharedInstance.arrayOfBestDeals.count > 0){
            sectionList.append("best_deals")
        }
        if(CustomServerResponseManager.sharedInstance.arrayOfBestDealBanners.count > 0){
                  sectionList.append("best_deals_banners")
        }
//        if(CustomServerResponseManager.sharedInstance.arrayOfiPhoneDeals.count > 0){
//            sectionList.append("iphone_deals")
//        }
        if(CustomServerResponseManager.sharedInstance.arrayOfBrands.count > 0){
            sectionList.append("brands")
        }
        if(CustomServerResponseManager.sharedInstance.arrayOfBoxing.count > 0){
            sectionList.append("boxing")
        }
        if(CustomServerResponseManager.sharedInstance.arrayOfBestDealBanners.count > 0){
            sectionList.append("best_deals_banners")
        }
    }
    
    func updateSearchUI() {
        searchContainer.layer.cornerRadius = searchContainer.frame.size.height/2.0
        searchContainer.layer.masksToBounds = true
    }
    
    @objc func onServerResponse(){
        populateDataSet()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .onServerResponse, object: nil)
    }
    
    
}
extension Notification.Name {
    static let onServerResponse = Notification.Name("onServerResponse")
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:String = sectionList[indexPath.row]

        if(item == "brands" || item == "boxing" || item == "best_deals"){
            let cell: BrandTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as! BrandTableViewCell
            cell.backgroundColor = UIColor.clear
            if(item == "brands"){
               cell.titleTC.text = "Brands"
            }
            else if(item == "best_deals"){
               cell.titleTC.text = "Best Deals"
            }
            else{
               cell.titleTC.text = "Boxing"
            }
            cell.getCategoryData()
                
           
            cell.selectionStyle = .none
            return cell

        }
        else if(item == "categories_banners"){
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.backgroundColor = UIColor.init(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
            cell.isCatBanner = true
            cell.updateflowLayout()
            cell.getCategoryData()
            
            cell.selectionStyle = .none
            return cell
        }
        else if(item == "best_deals_banners"){
               let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
               cell.backgroundColor = UIColor.init(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
               cell.isCatBanner = false
               cell.updateflowLayout()
               cell.getCategoryData()
               
               
               cell.selectionStyle = .none
               return cell
        }
        else{
            let cell: MyCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCustomTableViewCell", for: indexPath) as! MyCustomTableViewCell
            cell.backgroundColor = UIColor.clear
            
            cell.getCategoryData()
            
            
            cell.selectionStyle = .none
            return cell
        }

    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item:String = sectionList[indexPath.row]
        if(item == "brands" || item == "boxing"){
            return 136
        }
        else if(item == "categories_banners"){
            return 180
        }
        else if(item == "best_deals"){
            return 216
        }
        else if(item == "best_deals_banners"){
            return 150
        }
        return 100
    }
    
    
}

