//
//  MyCustomTableViewCell.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 07/07/2020.
//

import UIKit
import SDWebImage
class BrandTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var titleTC: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    var dataList:[CategoryModel] = []
    var dataList1:[DealModel] = []
    func getCategoryData(){
       
        
        if(titleTC.text == "Brands" || titleTC.text == "Best Deals"){
            if(dataList.count>0){
                dataList.removeAll()
            }
            for cat in CustomServerResponseManager.sharedInstance.arrayOfBrands {
                dataList.append(cat)
            }
        }
        else{
            if(dataList1.count>0){
                dataList1.removeAll()
            }
           for cat in CustomServerResponseManager.sharedInstance.arrayOfBoxing {
                dataList1.append(cat)
            }
        }
        self.collectionView.reloadData()
    }
    
    
    @IBAction func viewAllBtnPressed(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if(dataList.count>0){
            dataList.removeAll()
        }
        self.collectionView.register(UINib.init(nibName: "BrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandCollectionViewCell")
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if(titleTC.text == "Brands"){
//            return min(dataList.count,10)
//        }else{
//            return min(dataList1.count,10)
//        }
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BrandCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCollectionViewCell", for: indexPath as IndexPath) as! BrandCollectionViewCell
        
        if(titleTC.text == "Brands" || titleTC.text == "Best Deals"){
//            let brand = dataList[indexPath.row]
            let brand = dataList[0]
            if(!(brand.image.isEmpty)){
                let url:URL = URL(string: (brand.image))!
                
                cell.productIV.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
            }else{
                cell.productIV.sd_setImage(with:nil, placeholderImage: UIImage(named: "placeholder"))
            }
        }else{
//            let brand = dataList1[indexPath.row]
            let brand = dataList1[0]
            if(!(brand.image.isEmpty)){
                let url:URL = URL(string: (brand.image))!
                
                cell.productIV.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
            }else{
                cell.productIV.sd_setImage(with:nil, placeholderImage: UIImage(named: "placeholder"))
            }
        }
        
        cell.updateCell()
        return cell
    }
  
}
