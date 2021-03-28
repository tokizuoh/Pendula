//
//  VerificationListViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/03/27.
//

import UIKit

final class VerificationListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }

    var viewModel: [Verification]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: 実データに変更する
        viewModel = [
            Verification(title: "a"),
            Verification(title: "bbbbbbbbbbbbbbb"),
            Verification(title: "ccccccccccc")
        ]
    }

}

extension VerificationListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: カスタムセルを使用する
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?[indexPath.row].title
        return cell
    }

}
