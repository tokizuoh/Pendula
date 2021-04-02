//
//  ImosViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/02.
//

import UIKit

final class ImosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }

}

// TODO: 共通化
extension ImosViewController {
    private func setupNavigationItem() {
        navigationItem.title = "002_Imos"
        let backButton = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(popViewController))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
