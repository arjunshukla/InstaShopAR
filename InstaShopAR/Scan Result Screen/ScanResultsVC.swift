//
//  ScanResultsVC.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/7/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class ScanResultsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrResultImages = ["11", "22", "44"];
    var arrMatch = ["87.62 %", "84.90 %", "73 %"];
    var currentIndex = 0;
    
    @IBOutlet weak var collectionViewResults: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrMatch.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"resultCell" , for: indexPath) as! ScanResultCell;
        
        cell.lblMatchPercent.text = self.arrMatch[indexPath.row];
        cell.imgResultThumbnail.image = UIImage(named:self.arrResultImages[indexPath.row]);
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row;
        self.performSegue(withIdentifier: "segueToResultDetailsVC", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResultDetailsVC" {
            
                let controller = segue.destination as! ResultDetailsVC
                controller.currentScreen = self.currentIndex;
        }
    }
    
    
    
    //    MARK: Navigation
    @IBAction func backToSearchResults(segue:UIStoryboardSegue) { }
}
