//
//  ResultDetailsVC.swift
//  InstaShopAR
//
//  Created by Shukla,Arjun on 12/7/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class ResultDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgResultImage: UIImageView!
    
    @IBOutlet weak var imgInfluencerProfilePic: UIImageView!
    @IBOutlet weak var lblInfluencerName: UILabel!
    
    @IBOutlet weak var lblLikesCount: UILabel!
    
    @IBOutlet weak var tableViewResultData: UITableView!
    
    var arrResults = ["MSGM hot pink suit", "Jimmy Choo", "Mother Jeans"];
    
    
    override func viewDidLoad() {
        self.imgInfluencerProfilePic.layer.cornerRadius = self.imgInfluencerProfilePic.frame.width/2;
        self.imgInfluencerProfilePic.clipsToBounds = true;
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("onSwipe:"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("onSwipe:"))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //    MARK: Table view methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultDetailCell", for: indexPath)
        
        cell.textLabel?.text = "\(arrResults[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrResults.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell = self.tableViewResultData.cellForRow(at: indexPath)!;
        
        if(cell.accessoryType == UITableViewCellAccessoryType.checkmark){
            cell.accessoryType = UITableViewCellAccessoryType.none
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
   func onSwipe(swipeDirection: String) {
        print("Swiped!!")
    }
}
