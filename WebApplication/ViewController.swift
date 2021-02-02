//
//  ViewController.swift
//  WebApplication
//
//  Created by Huy Than Duc on 06/12/2020.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var backItem: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var goItem: UIBarButtonItem!
    @IBOutlet weak var refreshItem: UIBarButtonItem!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultURLWebView()
    }
    func setDefaultURLWebView() {
        if let myURL = URL(string:"https://www.google.vn") {
            webView.uiDelegate = self
            webView.navigationDelegate = self
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        isWorIndicator(isAnimated: true)
        self.backItem.isEnabled = false
        self.goItem.isEnabled = false
    }
    func isWorIndicator(isAnimated: Bool) {
        if isAnimated {
            indicatorView.startAnimating()
            indicatorView.isHidden = false
        } else {
            indicatorView.stopAnimating()
            indicatorView.isHidden = true
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isWorIndicator(isAnimated: false)
        if webView.canGoBack {
            self.backItem.isEnabled = true
        } else if webView.canGoForward {
            self.goItem.isEnabled = true
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goAnother(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func onRefresh(_ sender: Any) {
        webView.reload()
    }
}

