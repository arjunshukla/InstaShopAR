//
//  StoreCell.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/12/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class StoreCell: UICollectionViewCell {
    
    @IBOutlet weak var imgItem: UIImageView!
    
    @IBOutlet weak var imgCheckbox: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblItemPrice: UILabel!
    
    var checked = true;
}
