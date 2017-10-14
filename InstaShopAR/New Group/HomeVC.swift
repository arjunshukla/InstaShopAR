//
//  HomeVC.swift
//  InstaShopAR
//
//  Created by Arjun Shukla on 10/13/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    @IBAction func onLoginBtnTap(_ sender: Any) {
        let viewweb = self.storyboard?.instantiateViewController(withIdentifier: "InstaWebViewcontroller") as! LoginVC
        self.navigationController?.pushViewController(viewweb, animated: true)
    }
}
