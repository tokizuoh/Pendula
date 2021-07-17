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
    private var fractionComplete: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "013 PropertyAnimator",
                                blogURL: nil,
                                githubPRURL: nil)
        configureAnimation()
    }

    @IBAction func startAnimation(_ sender: Any) {
        switch animator.state {
        case .active:
            let durationFactor: CGFloat = 1.0 - animator.fractionComplete
            animator.continueAnimation(withTimingParameters: nil, durationFactor: durationFactor)

        case .inactive:
            animator.startAnimation()

        case .stopped:
            // NOP
            break
        }
    }

    @IBAction func pauseAnimation(_ sender: Any) {
        // アニメーションの進行度（0.0 ~ 1.0）を保存
        fractionComplete = animator.fractionComplete
        animator.pauseAnimation()
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
