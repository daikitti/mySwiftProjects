//
//  ViewController.swift
//  UIWebView+UIActivityIndicator+openPDF
//
//  Created by Have Dope on 02.02.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet{
            activityIndicator.isHidden = true
        }
    }
    
   @IBOutlet weak var goBackItem: UIBarButtonItem!
 
   @IBOutlet weak var goForwardItem: UIBarButtonItem!
    let Aplication  = UIApplication.shared
    
    var webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        webView = WKWebView(frame: CGRect(x: 0, y: 60, width: view.safeAreaLayoutGuide.layoutFrame.width, height: 714 ))
        print(view.safeAreaLayoutGuide.layoutFrame.height)
        
        if let myURL = URL(string: "https://jut.su/bleeach/season-1/episode-13.html") {
            let request = URLRequest(url: myURL)
            webView.load(request)
        }
        
        view.addSubview(webView)
        webView.navigationDelegate = self

    }
    // MARK: - Delegete
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        goBackItem.isEnabled = false
        goForwardItem.isEnabled = false
        activityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack{
            goBackItem.isEnabled = true
        }else if webView.canGoForward{
            goForwardItem.isEnabled = true
        }
        activityIndicator.isHidden = true
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        
    
        print("AAAAAAAAAAA что из этого реквест = ",  navigationAction.request )
        return .allow
        
    }
    //MARK: - Action
    
    
    @IBAction func goBackAction(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    
    @IBAction func refreshAction(_ sender: Any) {
       webView.reload()
    }
    
    
}

