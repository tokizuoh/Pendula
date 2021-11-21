//
//  ComponentBaseViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/04.
//

import UIKit

class ComponentBaseViewController: UIViewController {

    func configureNavigationItem(navigationTitle: String, blogURL: URL? = nil, githubPRURL: URL? = nil) {
        navigationItem.title = navigationTitle
        configureLeftBarButtonItem()
        configureRightBarButtonItem(blogURL: blogURL, githubPRURL: githubPRURL)
    }

    private func configureLeftBarButtonItem() {
        let backButtonItem = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                             style: .plain,
                                             target: self,
                                             action: #selector(popViewController))
        navigationItem.leftBarButtonItem = backButtonItem
    }

    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    private func configureRightBarButtonItem(blogURL: URL?, githubPRURL: URL?) {
        var children = [UIMenuElement]()

        if let blogURL = blogURL {
            let blogLinkButton = UIAction(title: "ブログ",
                                          image: R.image.external_link()?.withRenderingMode(.alwaysOriginal)) { (_) in
                UIApplication.shared.open(blogURL)
            }
            children.append(blogLinkButton)

        }

        if let githubPRURL = githubPRURL {
            let githubLinkButton = UIAction(title: "Pull Request",
                                            image: R.image.github()?.withRenderingMode(.alwaysOriginal)) { (_) in
                UIApplication.shared.open(githubPRURL)
            }
            children.append(githubLinkButton)
        }

        guard children.count > 0 else {
            return
        }

        let menu = UIMenu(title: "この画面の詳細を知る",
                          image: R.image.information()?.withRenderingMode(.alwaysOriginal),
                          options: .destructive,
                          children: children)
        let menuBarItem = UIBarButtonItem(image: R.image.information()?.withRenderingMode(.alwaysOriginal),
                                          menu: menu)
        navigationItem.rightBarButtonItem = menuBarItem
    }

}
