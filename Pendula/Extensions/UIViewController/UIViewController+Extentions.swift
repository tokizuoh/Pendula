//
//  ComponentViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/04.
//

import UIKit

extension UIViewController {

    func setupNavigationItem(title: String) {
        navigationItem.title = title
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
