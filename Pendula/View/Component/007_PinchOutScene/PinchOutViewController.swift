//
//  PinchOutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/23.
//

import UIKit

final class PinchOutViewController: ComponentBaseViewController {

    var startPoint: CGPoint?
    var startPointView: UIView?
    var finishPointView: UIView?

    var squareViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "007 PinchOut",
                                blogURL: nil,
                                githubPRURL: nil)
        configureGestures()
    }

}

// MARK: - UIGestureRecognizer
extension PinchOutViewController {

    private func configureGestures() {
        let singleTapGesture = UITapGestureRecognizer(target: self,
                                                      action: #selector(detectSingleTap(sender:)))
        singleTapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGesture)

        let swipeGesture = UISwipeGestureRecognizer(target: self,
                                                    action: #selector(detectSwipeGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }

    @objc private func detectSingleTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)

        if let startPoint = startPoint {
            finishAnimation(startPoint: startPoint,
                            endPoint: location)
            self.startPoint = nil
        } else {
            beginAnimation(location: location)
            self.startPoint = location
        }
    }

    @objc private func detectSwipeGesture() {
        _ = squareViews.map { $0.removeFromSuperview() }
        self.squareViews.removeAll()
    }
}

// MARK: - Animation
extension PinchOutViewController {

    private func beginAnimation(location: CGPoint) {
        startPointView = UIView(frame: CGRect(x: location.x,
                                              y: location.y,
                                              width: 20,
                                              height: 20))
        startPointView?.backgroundColor = .red
        view.addSubview(startPointView!)
    }

    private func finishAnimation(startPoint: CGPoint, endPoint: CGPoint) {
        func generateSquareView(startPoint: CGPoint, endPoint: CGPoint) {
            let width = endPoint.x - startPoint.x
            let height = endPoint.y - startPoint.y
            let squareView = UIView(frame: CGRect(x: min(startPoint.x, endPoint.x),
                                                  y: min(startPoint.y, endPoint.y),
                                                  width: abs(width),
                                                  height: abs(height)))
            squareView.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1.0),
                                                 saturation: 100/100,
                                                 brightness: 100/42,
                                                 alpha: 0.5)
            squareView.alpha = 0.3
            view.addSubview(squareView)
            squareViews.append(squareView)
        }

        view.isUserInteractionEnabled = false
        finishPointView = UIView(frame: CGRect(x: endPoint.x,
                                               y: endPoint.y,
                                               width: 20,
                                               height: 20))
        finishPointView?.backgroundColor = .blue
        view.addSubview(finishPointView!)

        generateSquareView(startPoint: startPoint,
                           endPoint: endPoint)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            self.startPointView?.removeFromSuperview()
            self.finishPointView?.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
    }

}
