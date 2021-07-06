//
//  PropertyAnimatorViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/07/06.
//

import UIKit

final class PropertyAnimatorViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(R.nib.propertyAnimatorListTableViewCell)
        }
    }

    struct ViewModel {
        let title: String
        let viewController: UIViewController
    }
    var viewModels: [ViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "013 PropertyAnimator",
                                blogURL: nil,
                                githubPRURL: nil)
        configureViewModels()
    }

}

extension PropertyAnimatorViewController {

    private func configureViewModels() {
        viewModels = [
            ViewModel(title: "四角形 移動",
                      viewController: R.storyboard.squareAnimator.squareAnimator()!)
        ]
    }

}

extension PropertyAnimatorViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = viewModels else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.propertyAnimatorListTableViewCell, for: indexPath)!
        let viewModel = PropertyAnimatorListTableViewCell.ViewModel(title: viewModels[indexPath.row].title)
        cell.viewModel = viewModel
        cell.setup()
        return cell
    }

}

extension PropertyAnimatorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModels = viewModels else {
            return
        }
        let vc = viewModels[indexPath.row].viewController
        navigationController?.pushViewController(vc, animated: true)
    }

}
