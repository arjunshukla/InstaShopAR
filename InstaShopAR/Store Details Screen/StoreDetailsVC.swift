//
//  StoreDetailsVC.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/11/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class StoreDetailsVC: UIViewController {
    override func viewDidLoad() {
        
    }
    
    @IBAction func onBackToStoreListBtnTap(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToStoreListVC", sender: self)
    }
}
