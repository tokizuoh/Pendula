//
//  ShinyColorsGalleryViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/07.
//

import UIKit

final class ShinyColorsGalleryViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(R.nib.shinyColorsGalleryTableViewCell)
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    private var component: [ShinyColorsGalleryTableViewComponent]?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "003_ShinyColors_Garally",
                                blogURL: nil,
                                githubPRURL: nil)
    }

    // TODO: 動的にする
    private func configureComponent() {
        component = [
            .title
        ]
    }

}

extension ShinyColorsGalleryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.shinyColorsGalleryTableViewCell,
                                                 for: indexPath)!
        return cell
    }

}

extension ShinyColorsGalleryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
