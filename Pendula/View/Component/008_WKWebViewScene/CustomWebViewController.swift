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
        configureWebView()
    }

}

extension CustomWebViewController {

    // TODO [#67]: 画面読み込み時にちらつきがあるのでindicatorを入れる
    private func configureWebView() {
        let url = URL(string: "https://tokizuoh.dev/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}
