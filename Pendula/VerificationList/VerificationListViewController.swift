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
            tableView.delegate = self
            tableView.register(R.nib.verificationTableViewCell)
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    private var viewModels: [Verification]? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModels = [
            Verification(title: "a"),
            Verification(title: "bbbbbbbbbbbbbbb"),
            Verification(title: "ccccccccccc")
        ]
    }

}

extension VerificationListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.verificationTableViewCell, for: indexPath)!
        cell.viewModel = VerificationTableViewCell.ViewModel(title: viewModels?[indexPath.row].title ?? "")
        cell.setup()
        return cell
    }

}

extension VerificationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
