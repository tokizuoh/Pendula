//
//  FadeAnimationListViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/17.
//

import UIKit

final class FadeAnimationListViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(R.nib.fadeAnimationTableViewCell)
        }
    }

    struct ViewModel {
        let title: String
    }

    var viewModels: [ViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "005 CellAnimation",
                                blogURL: nil,
                                githubPRURL: nil)
        configtureViewModels()
    }

}

extension FadeAnimationListViewController {

    private func configtureViewModels() {
        viewModels = [
            ViewModel(title: "さんぷるてきすと"),
            ViewModel(title: "サンプルテキスト サンプルテキスト"),
            ViewModel(title: "SampleText SampleText SampleText"),
            ViewModel(title: "0123456789 0123456789 0123456789 0123456789"),
            ViewModel(title: "今日は良い天気 今日は良い天気 今日は良い天気 今日は良い天気 今日は良い天気"),
            ViewModel(title: "カルボナーラ食べたい カルボナーラ食べたい カルボナーラ食べたい カルボナーラ食べたい カルボナーラ食べたい カルボナーラ食べたい")
        ]
    }

}

extension FadeAnimationListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = viewModels,
              viewModels.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.fadeAnimationTableViewCell, for: indexPath)!
        cell.setTitleLabel(title: viewModels[indexPath.row].title)
        return cell
    }

}

extension FadeAnimationListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
