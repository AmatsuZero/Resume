//
//  DisplayViewController.swift
//  ResumeDisplay
//
//  Created by modao on 2018/1/31.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Cocoa
import WebKit

class DisplayViewController: NSViewController {

    @IBOutlet weak var webview: WKWebView!
    private var resumeModel: ResumeModel = ResumeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if let path = resumeModel.genertate() {
            let url = URL(fileURLWithPath: path)
            webview.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}

extension DisplayViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("start")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
}
