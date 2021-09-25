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
        configureHalfModal()
    }

    @IBAction func toggleDetent(_ sender: Any) {
        let nextDetent: UISheetPresentationController.Detent.Identifier

        if sheetPresentationController.selectedDetentIdentifier == .large {
            nextDetent = .medium
        } else {
            nextDetent = .large
        }

        sheetPresentationController.animateChanges {
            sheetPresentationController.selectedDetentIdentifier = nextDetent
        }
    }

}

extension HalfModalContentViewController {

    private func configureHalfModal() {
        sheetPresentationController.delegate = self
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium(),
            .large()
        ]
    }

}
