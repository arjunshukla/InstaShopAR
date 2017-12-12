//
//  ResultDetailsVC.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/7/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyJSON

class ResultDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgResultImage: UIImageView!
    
    @IBOutlet weak var imgInfluencerProfilePic: UIImageView!
    @IBOutlet weak var lblInfluencerName: UILabel!
    
    @IBOutlet weak var lblLikesCount: UILabel!
    
    @IBOutlet weak var tableViewResultData: UITableView!
    
//    var results: JSON = JSON()
    
    var arrResults1 = ["MSGM hot pink suit", "Jimmy Choo", "Mother Jeans"];
    var arrResults2 = ["MSGM hot pink suit", "MSGM pink trousers", "ALC X Nike", "RayBan Sunglasses"];
    var arrResults3 = ["Zara Pink Blazer", "Life in the Pink Lane", "Chic Wish Mesh Dress"];
    var arrCurrentData: Array = [""];
    var currentScreen = 0;
    var arrResultImages = ["11", "22", "44"];
    
    
    
    override func viewDidLoad() {
        self.currentScreen = 0;
        self.arrCurrentData = self.arrResults1;
        self.imgInfluencerProfilePic.layer.cornerRadius = self.imgInfluencerProfilePic.frame.width/2;
        self.imgInfluencerProfilePic.clipsToBounds = true;
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onRightSwipe(sender:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onLeftSwipe(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //    MARK: Table view methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultDetailCell", for: indexPath)
        
        cell.textLabel?.text = "\(arrCurrentData[indexPath.row])"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCurrentData.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell = self.tableViewResultData.cellForRow(at: indexPath)!;
        
        if(cell.accessoryType == UITableViewCellAccessoryType.checkmark){
            cell.accessoryType = UITableViewCellAccessoryType.none
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    @objc func onRightSwipe(sender: AnyObject?) {
        print("Right Swiped!!")
        // move back, decrememt array
        if(self.currentScreen > 0) {
            self.currentScreen -= 1;
             self.reloadData();
        }
        
        // change screen indicator
       
    }
    
    @objc func onLeftSwipe(sender: AnyObject?) {
        print("Left Swiped!!")
        // move forward, incrememt array
        if(self.currentScreen < 2) {
            self.currentScreen += 1;
            self.reloadData();
        }
        
        // change screen indicator
        
        // reload image and table data
        
    }
    
    func reloadData() {
        switch self.currentScreen {
        case 0:
            self.arrCurrentData = self.arrResults1;
            break;
        case 1:
            self.arrCurrentData = self.arrResults2;
            break;
        case 2:
            self.arrCurrentData = self.arrResults3;
            break;
        default:
            break;
        }
         self.tableViewResultData.reloadData();
        print("Current screen no \(self.currentScreen)")
        self.imgResultImage.image = UIImage(named: arrResultImages[self.currentScreen]);
    }
}
