//
//  PropertyAnimatorViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/07/06.
//

import UIKit

final class PropertyAnimatorViewController: ComponentBaseViewController {

    @IBOutlet weak var squareView: UIView!

    private var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "013 PropertyAnimator",
                                blogURL: nil,
                                githubPRURL: nil)
        configureAnimation()
    }

    @IBAction func startAnimation(_ sender: Any) {
        animator.startAnimation()
    }

    @IBAction func resetAnimation(_ sender: Any) {
        // TODO [#82]: アニメーションリセット処理
    }

    @IBAction func stopAnimation(_ sender: Any) {
        // TODO [#82]: アニメーション停止処理
    }

}

extension PropertyAnimatorViewController {

    private func configureAnimation() {
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
            // 四角UIViewを画面右端まで移動させる
            self.squareView.center.x += self.view.bounds.width / 2 - self.squareView.bounds.width / 2
        })
    }

}
