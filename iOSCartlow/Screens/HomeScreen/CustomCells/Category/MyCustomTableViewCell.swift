//
//  MyCustomTableViewCell.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 07/07/2020.
//

import UIKit
import SDWebImage
class MyCustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!

    var dataList:[CategoryModel] = []
    func getCategoryData(){
        if(dataList.count>0){
            dataList.removeAll()
        }
        
        for cat in CustomServerResponseManager.sharedInstance.arrayOfCategories {
            dataList.append(cat)
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
        self.collectionView.register(UINib.init(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCustomCollectionViewCell")
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyCustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCustomCollectionViewCell", for: indexPath as IndexPath) as! MyCustomCollectionViewCell
        let brand = dataList[0]
        if(!(brand.image.isEmpty)){
            let url:URL = URL(string: (brand.image))!
            cell.productIV.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
        }else{
            cell.productIV.sd_setImage(with:nil, placeholderImage: UIImage(named: "placeholder"))
        }
        cell.productItem = brand
        cell.updateCell()
        return cell
    }
  
}
