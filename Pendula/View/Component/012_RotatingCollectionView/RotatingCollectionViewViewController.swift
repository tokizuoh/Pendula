//
//  RotatingCollectionViewViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/06/12.
//

import UIKit

final class RotatingCollectionViewViewController: ComponentBaseViewController {

    @IBOutlet weak var foundationView: UIView! {
        didSet {
            foundationView.layer.cornerRadius = foundationView.bounds.width / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "012 RotatingCollectionView",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}
