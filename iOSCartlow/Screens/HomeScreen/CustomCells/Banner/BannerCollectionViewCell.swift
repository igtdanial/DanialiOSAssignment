//
//  MyCustomCollectionViewCell.swift
//  RashanApp
//
//  Created by i General Trading on 9/26/18.
//  Copyright © 2018 Danial Hussain. All rights reserved.
//

import UIKit
import QuartzCore
import AudioToolbox
class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet var innerImageContainer: UIView!
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var productIV: UIImageView!
    
    var value:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateCell()
        
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateCell()
    }

    func updateCell(){
        innerImageContainer.layer.cornerRadius = 8.0
        innerImageContainer.layer.borderColor = UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0).cgColor
        innerImageContainer.layer.borderWidth = 1.0
        innerImageContainer.backgroundColor = UIColor.white
        innerImageContainer.layer.shadowColor = UIColor.init(red: 162/255.0, green: 172/255.0, blue: 187/255.0, alpha: 1.0).cgColor

        innerImageContainer.layer.masksToBounds = true
    
        
    }
    
}
