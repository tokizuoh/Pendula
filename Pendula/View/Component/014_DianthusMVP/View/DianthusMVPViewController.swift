//
//  DianthusMVPViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import UIKit

final class DianthusMVPViewController: ComponentBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "014 Dianthus by MVP",
                                blogURL: nil,
                                githubPRURL: nil)
        fetch()
    }

    private func fetch() {
        let plistManager = PlistManager(fileName: "basic")
        print(plistManager?.getValue(key: "username"))
        print(plistManager?.getValue(key: "password"))
    }

}
