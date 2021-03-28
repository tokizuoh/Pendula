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
        setupNavigationItem()
        setupViewModels()
    }

    private func setupNavigationItem() {
        navigationItem.title = "Verifications"
        let backButton = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backView))
        navigationItem.leftBarButtonItem = backButton
    }

    private func setupViewModels() {
        let calendar = Calendar.current
        let date = Date()
        viewModels = [
            Verification(title: "a",
                         lastUpdateDate: calendar.date(byAdding: .day,
                                                       value: 1,
                                                       to: calendar.startOfDay(for: date))!),
            Verification(title: "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                         lastUpdateDate: calendar.date(byAdding: .day,
                                                       value: -1,
                                                       to: calendar.startOfDay(for: date))!),
            Verification(title: "ccccccccccc",
                         lastUpdateDate: calendar.date(byAdding: .day,
                                                       value: -1,
                                                       to: calendar.startOfDay(for: date))!)
        ]
    }

    @objc private func backView() {
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.5
        transition.subtype = .fromLeft
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }

}

extension VerificationListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = viewModels else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.verificationTableViewCell, for: indexPath)!
        let cellViewModel = VerificationTableViewCell.ViewModel(title: viewModels[indexPath.row].title,
                                                                lastUpdatedDateText: viewModels[indexPath.row].lastUpdateDate.string())
        cell.viewModel = cellViewModel
        cell.setup()
        return cell
    }

}

extension VerificationListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
}
