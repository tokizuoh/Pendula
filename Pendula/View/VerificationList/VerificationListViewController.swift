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
        configureNavigationItem()
        configureViewModels()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    private func configureNavigationItem() {
        navigationItem.title = "Verifications"
        let backButton = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backView))
        navigationItem.leftBarButtonItem = backButton
    }

    private func configureViewModels() {
        // TODO: DIの方法を考え直す（ymlなど）
        viewModels = [
            Verification(title: "不規則なCellを持つUICollectionViewを試す",
                         lastUpdateDate: "2021.03.31".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.irregularLayout.irregularLayout()!),
            Verification(title: "imos法でセルの状態を管理する",
                         lastUpdateDate: "2021.04.02".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.imos.imos()!),
            Verification(title: "アイドルマスターシャイニーカラーズ公式サイトのユニットページのギャラリー生成器を作る",
                         lastUpdateDate: "2021.04.07".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.shinyColorsGallery.shinyColorsGallery()!)
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
                                                                lastUpdatedDateText: viewModels[indexPath.row].lastUpdateDate.string(format: .yyyyMMddPd))
        cell.viewModel = cellViewModel
        cell.setup()
        return cell
    }

}

extension VerificationListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModels?[indexPath.row] else {
            return
        }

        navigationController?.pushViewController(viewModel.viewController, animated: true)
    }

}
