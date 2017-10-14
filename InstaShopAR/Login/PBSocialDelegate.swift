//
//  PBSocialDelegate.swift
//  InstaShopAR
//
//  Created by Arjun Shukla on 10/13/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
protocol PBSocialDelegate
{
    
    //MARK: Google
    func getGoogleLoginResponse(userData : [String : AnyObject])
    
    //MARK: Facebook
    func getFacebookLoginResponse(userData : [String : AnyObject])
    
    //MARK: LinkedIn
    func getLinkedinResponse(userData : [String : AnyObject])
    
    //MARK: Twitter
    func getTwitterLoginResponse(userData : [String : AnyObject])
    
    func getTwitterShareResponse(userData : [String : AnyObject])
    
    //MARK: Instagram
    func getInstagramLoginResponse(userData : [String : AnyObject])
    
}

var pbSocialDelegate : PBSocialDelegate!
