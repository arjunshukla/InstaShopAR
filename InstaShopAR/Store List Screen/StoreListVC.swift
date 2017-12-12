//
//  StoreListVC.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/11/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyJSON

class StoreListVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dictItems: Dictionary = ["temp":["1"]] ;
    
    @IBOutlet weak var collectionViewItems: UICollectionView!
    
    override func viewDidLoad() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dictItems["items"]!.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as! StoreCell;
        
        cell.imgItem.image = UIImage(named:(self.dictItems["images"]?[indexPath.row])!);
        
        cell.lblItemName.text = self.dictItems["items"]?[indexPath.row];
        cell.lblItemPrice.text = self.dictItems["price"]?[indexPath.row]
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        manipulateCellAtIndexPath(indexPath: indexPath)
    }
    
    func manipulateCellAtIndexPath(indexPath: IndexPath) {
        if let cell = self.collectionViewItems?.cellForItem(at: indexPath) as? StoreCell {
            
            if(cell.checked) {
                cell.imgCheckbox.image = UIImage(named:"unchecked")
                cell.checked = false;
            } else {
                cell.imgCheckbox.image = UIImage(named:"checked")
                cell.checked = true;
            }
            
        }
    }
    
    @IBAction func onBackBtntap(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToResultsVC", sender: self)
    }
    
    @IBAction func backToStoreList(segue:UIStoryboardSegue) { }
}
