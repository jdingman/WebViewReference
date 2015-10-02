//
//  ViewController.swift
//  Webby
//
//  Created by Josh.M.Dingman on 10/2/15.
//  Copyright © 2015 Josh.M.Dingman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var localWebView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let localfilePath = NSBundle.mainBundle().URLForResource("index", withExtension: "html", subdirectory: "www")
        let myRequest = NSURLRequest(URL: localfilePath!);
        localWebView.delegate = self;
        localWebView.loadRequest(myRequest);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let URL:NSURL = request.URL!
        if (URL.scheme == "callmycode") {
            let urlString:String = request.URL!.absoluteString
            let urlParts:NSArray = urlString.componentsSeparatedByString(":")
            if (urlParts.count > 1) {
                let parameters:NSArray = urlParts.objectAtIndex(1).componentsSeparatedByString("&")
                let methodName:NSString = parameters.objectAtIndex(0) as! NSString
                let variableName:NSString = parameters.objectAtIndex(1) as! NSString
                let alert:UIAlertView = UIAlertView.init(title: "Message received", message: "\(methodName) ---- \(variableName)", delegate: nil, cancelButtonTitle: "ok")
                alert.show()
                return false;
            }
        }
        return true;
    }

    @IBAction func sendMessageToWebView(message:AnyObject?) {
        self.localWebView.stringByEvaluatingJavaScriptFromString("callIntoWebView()");
    }
    
    func callBluetooth() {
        
    }
}

