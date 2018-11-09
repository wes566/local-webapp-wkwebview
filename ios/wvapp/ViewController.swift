//
//  ViewController.swift
//  wvapp
//
//  Created by Wes Peter on 11/8/18.
//  Copyright © 2018 Wes Peter. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // NOTE: non-public API
        // Needed for client-side non-hash routing to work... I think.  I couldn't get it to work
        // without the following line, would love to be wrong :)
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "webapp")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        webView.load(URLRequest(url: url))
    }


}

