//
//  PinchOutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/23.
//

import UIKit

final class PinchOutViewController: ComponentBaseViewController {

    var startPoint: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "007 PinchOut",
                                blogURL: nil,
                                githubPRURL: nil)
        configureGesture()
    }

}

// MARK: - UIGestureRecognizer
extension PinchOutViewController {

    private func configureGesture() {
        let singleTapGesture = UITapGestureRecognizer(target: self,
                                                      action: #selector(detectSingleTap(sender:)))
        singleTapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGesture)
    }

    @objc private func detectSingleTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location.x, location.y)

        if let startPoint = startPoint {
            // Animation
        } else {
            // Animation
            self.startPoint = location
        }
    }

}

// MARK: - Animation
extension PinchOutViewController {

    private func beginAnimation() {

    }

    private func finishAnimation() {

    }

}
