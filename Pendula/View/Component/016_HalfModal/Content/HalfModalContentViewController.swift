//
//  HalfModalContentViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/25.
//

import UIKit

final class HalfModalContentViewController: UIViewController, UISheetPresentationControllerDelegate {

    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHaldModal()
    }

}

extension HalfModalContentViewController {

    private func configureHaldModal() {
        sheetPresentationController.delegate = self
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium()
        ]
    }

}
