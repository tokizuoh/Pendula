//
//  PropertyAnimatorViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/07/06.
//

import UIKit

final class PropertyAnimatorViewController: ComponentBaseViewController {

    @IBOutlet weak var squareView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "013 PropertyAnimator",
                                blogURL: nil,
                                githubPRURL: nil)
    }

    @IBAction func startAnimation(_ sender: Any) {
        // TODO [#82]: アニメーション開始処理
    }

    @IBAction func stopAnimation(_ sender: Any) {
        // TODO [#82]: アニメーション停止処理
    }

}
