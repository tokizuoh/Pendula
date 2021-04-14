//
//  SwipePageViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/14.
//

import UIKit

final class SwipePageViewController: ComponentBaseViewController {

    @IBOutlet weak var pageIndexLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "004 SwipePage",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}
