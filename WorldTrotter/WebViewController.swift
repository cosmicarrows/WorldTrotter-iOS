//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Laurence Wingo on 11/11/17.
//  Copyright © 2017 Laurence Wingo. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController{
    
    var webView: WKWebView!
    
    override func loadView() {
        view = webView
        let myURL = URL.init(string: "https://www.apple.com")
        let webConfiguration = WKWebViewConfiguration()
        let myUrlRequest = URLRequest.init(url: myURL!)
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.load(myUrlRequest)
    }
}
