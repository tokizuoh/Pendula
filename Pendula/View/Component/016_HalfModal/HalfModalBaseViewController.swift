//
//  HalfModalBaseViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/25.
//

import UIKit

final class HalfModalBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentModal(_ sender: Any) {
        let vc = R.storyboard.halfModalContent.halfModalContent()!
        present(vc, animated: true)
    }

}
