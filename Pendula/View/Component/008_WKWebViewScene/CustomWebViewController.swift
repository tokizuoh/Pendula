//
//  CustomWebViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/28.
//

import UIKit
import WebKit

final class CustomWebViewController: ComponentBaseViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // TODO [#67]: 取得したhtmlのなにかを取得する
    @IBOutlet weak var dummyLabel: UILabel! {
        didSet {
            dummyLabel.text = "DUMMY"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "008 WebView",
                                blogURL: nil,
                                githubPRURL: nil)
        configureActivityIndicator()
        configureWebView()
    }

}

// MARK: - WKWebView
extension CustomWebViewController {

    private func configureWebView() {
        webView.navigationDelegate = self
        let url = URL(string: "https://tokizuoh.dev/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}

// MARK: - UIActivityIndicator
extension CustomWebViewController {

    private func configureActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }

}

// MARK: - WKNavigationDelegate
extension CustomWebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [unowned self] in
            self.activityIndicator.stopAnimating()
            decisionHandler(.allow)
        }
    }

}
