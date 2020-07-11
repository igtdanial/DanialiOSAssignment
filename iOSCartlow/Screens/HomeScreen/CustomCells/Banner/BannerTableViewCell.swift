//
//  MyCustomTableViewCell.swift
//  iOSCartlow
//
//  Created by Danial Hussain on 07/07/2020.
//

import UIKit
import SDWebImage
class BannerTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    var dataList:[BannerModel] = []
    var isCatBanner:Bool = false
    func getCategoryData(){
        if(dataList.count>0){
            dataList.removeAll()
        }
        
        for cat in CustomServerResponseManager.sharedInstance.arrayOfCatBanners {
            dataList.append(cat)
        }
        self.collectionView.reloadData()
    }
    
    func updateflowLayout(){
        self.flowLayout.itemSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: isCatBanner ? 180 : 150)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if(dataList.count>0){
            dataList.removeAll()
        }
        self.collectionView.register(UINib.init(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.flowLayout.itemSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: isCatBanner ? 180 : 150)
        
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath as IndexPath) as! BannerCollectionViewCell
        let brand = dataList[0]
        if(!(brand.image.isEmpty)){
            let url:URL = URL(string: (brand.image))!
            cell.productIV.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
        }else{
            cell.productIV.sd_setImage(with:nil, placeholderImage: UIImage(named: "placeholder"))
        }
        cell.updateCell()
        return cell
    }
    
    
    
}
