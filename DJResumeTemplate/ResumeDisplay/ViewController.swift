//
//  ViewController.swift
//  ResumeDisplay
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    private var resumeModel: ResumeModel = ResumeModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.navigationDelegate = self
        view.addSubview(webview)
        // Do view setup here.
        if let path = resumeModel.genertate() {
            let url = URL(fileURLWithPath: path)
            webview.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}

extension ViewController: WKNavigationDelegate {

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
