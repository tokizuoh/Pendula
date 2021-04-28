//
//  CustomWebViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/28.
//

import UIKit

final class CustomWebViewController: ComponentBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "008 WebView",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}
