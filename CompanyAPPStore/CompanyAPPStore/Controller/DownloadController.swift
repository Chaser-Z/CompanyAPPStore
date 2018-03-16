//
//  DownloadController.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/14.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import UIKit

class DownloadController: UIViewController,UIWebViewDelegate {

    private var webView: UIWebView!
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let link = self.link {
            let dataURL = URL(string:link)
            let request = URLRequest(url:dataURL!)
            webView = UIWebView(frame: view.frame)
            webView.scrollView.showsVerticalScrollIndicator = false
            webView.scalesPageToFit = true
            webView.delegate = self
            webView.loadRequest(request)
            view.addSubview(webView)
        }
                
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
