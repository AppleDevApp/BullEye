//
//  WebViewController.swift
//  BullEye
//
//  Created by AppleDevApp on 21/10/17.
//  Copyright © 2017年 AppleDevApp. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func closeView() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
    }
}
