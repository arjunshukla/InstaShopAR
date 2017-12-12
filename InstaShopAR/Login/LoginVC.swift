//
//  LoginVC.swift
//  InstaShopAR
//
//  Created by Arjun Shukla on 10/12/17.
//  Copyright © 2017 arjunshukla. All rights reserved.
//

import Foundation
import UIKit
import InstagramKit
import WebKit
import Alamofire

class LoginVC: UIViewController, WKNavigationDelegate, WKScriptMessageHandler, PBSocialDelegate {
    
    var KAUTHURL = "https://api.instagram.com/oauth/authorize/"
    
    var kAPIURl = "https://api.instagram.com/v1/users/"
    
    var KCLIENTID = "29cadd71acda467e9912024ae2254307"
    
    var KCLIENTSERCRET = "66d6fdca112349c1b44e7d2d15566080"
    
    var kREDIRECTURI = "http://localhost:3000/v1/instashop"
    
    @IBOutlet weak var loginWebView: WKWebView!
    
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        pbSocialDelegate = self
        let authURL = InstagramEngine.shared().authorizationURL()
        self.loginWebView.navigationDelegate = self
        self.loginWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        self.loginWebView.load(URLRequest.init(url: authURL))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            self.progressView.isHidden = self.loginWebView.estimatedProgress == 1
            self.progressView.setProgress(Float(self.loginWebView.estimatedProgress), animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        do
        {
            if let url = webView.url
            {
                print(url)
                
                if String(describing: url).range(of: "#access_token") != nil
                {
                    try InstagramEngine.shared().receivedValidAccessToken(from: webView.url!)
                    
                    if let accessToken = InstagramEngine.shared().accessToken
                    {
                        print("accessToken: \(accessToken)")
                        
                        //start
                        let URl = "https://api.instagram.com/v1/users/self/?access_token=\(accessToken)"
                        
                        let parameter = [ "access_token" : accessToken ]
                        
                        //                        appInstance.showLoader()
                        
                        Alamofire.request(URl, method: .get, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
                            .responseJSON { response in
                                //                                appInstance.hideLoader()
                                print(response.result.value!)
                                if response.result.isSuccess {
                                    let dict = response.result.value!
                                    do {
                                        var result : [String : AnyObject] = [String : AnyObject]()
                                        let data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
                                        
                                        if let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                                            print(json)
                                            result["result"] = json
                                            if pbSocialDelegate != nil
                                            {
                                                pbSocialDelegate.getInstagramLoginResponse(userData : result)
                                                self.navigationController?.popViewController(animated: true)
                                            }
                                        }
                                    }
                                    catch let err as NSError {
                                        print(err.debugDescription)
                                    }
                                }
                        }
                    }
                }
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
        //        return true
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("User Info from error:\(error)");
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation")
        
        //        if ( self.loginWebView!.url?.absoluteString == "https://myserver.com/successurl" )
        //        {
        //            print("SUCCESS")
        //            self.loginWebView!.stopLoading()
        //            // do something here, like remove this from the nav controller
        //            self.navigationController?.popViewController(animated: true)
        //        }
        
        do
        {
            if let url = webView.url
            {
                print(url)
                
                if String(describing: url).range(of: "#access_token") != nil
                {
                    try InstagramEngine.shared().receivedValidAccessToken(from: webView.url!)
                    
                    if let accessToken = InstagramEngine.shared().accessToken
                    {
                        print("accessToken: \(accessToken)")
                        
                        //start
                        let URl = "https://api.instagram.com/v1/users/self/?access_token=\(accessToken)"
                        
                        let parameter = [ "access_token" : accessToken ]
                        
                        //                        appInstance.showLoader()
                        
                        Alamofire.request(URl, method: .get, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
                            .responseJSON { response in
                                //                                appInstance.hideLoader()
                                print(response.result.value!)
                                if response.result.isSuccess {
                                    let dict = response.result.value!
                                    do {
                                        var result : [String : AnyObject] = [String : AnyObject]()
                                        let data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
                                        
                                        if let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                                            print(json)
                                            result["result"] = json
                                            if pbSocialDelegate != nil
                                            {
                                                pbSocialDelegate.getInstagramLoginResponse(userData : result)
//                                                self.navigationController?.popViewController(animated: true)
                                                let scanScreen = self.storyboard?.instantiateViewController(withIdentifier: "scanARVC") as! ScanARVC
                                                
                                                self.navigationController?.present(scanScreen, animated: true)
                                            }
                                        }
                                    }
                                    catch let err as NSError {
                                        print(err.debugDescription)
                                    }
                                }
                        }
                    }
                }
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("User Info from error:\(error)");
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("In message func");
    }
    
    func getGoogleLoginResponse(userData: [String : AnyObject]) {
        
    }
    
    func getFacebookLoginResponse(userData: [String : AnyObject]) {
        
    }
    
    func getLinkedinResponse(userData: [String : AnyObject]) {
        
    }
    
    func getTwitterLoginResponse(userData: [String : AnyObject]) {
        
    }
    
    func getTwitterShareResponse(userData: [String : AnyObject]) {
        
    }
    //MARK: Instagram response
    func getInstagramLoginResponse(userData: [String : AnyObject]) {
        print("Instagram")
        print(userData)
    }
}


/*
 <array>
           <string>fb</string>
           <string>fbapi</string>
             <string>fbauth2</string>
           <string>fbshareextension</string>
             <string>fb-messenger-api</string>
           <string>twitter</string>
           <string>viber</string>
           <string>whatsapp</string>
           <string>wechat</string>
           <string>line</string>
           <string>instagram</string>
           <string>kakaotalk</string>
           <string>mqq</string>
           <string>vk</string>
           <string>comgooglemaps</string>
           <string>googlephotos</string>
         </array>
 <key>InstagramAppClientId</key>
 <string>29cadd71acda467e9912024ae2254307</string>
 <key>InstagramAppRedirectURL</key>
 [webview stringByEvaluatingJavaScriptFromString:@"window.location.hash"]
 <string>https://www.peerbits.com</string>
 */
