//
//  VerificationListViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/03/27.
//

import UIKit
import HealthKit

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

}

extension VerificationListViewController {

    private func configureViewModels() {
        // TODO: DIの方法を考え直す（ymlなど）
        viewModels = [
            Verification(title: "不規則なCellを持つUICollectionViewを試す",
                         lastUpdateDate: "2021.03.31".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.irregularLayout.irregularLayout()!),
            Verification(title: "imos法でセルの状態を管理する",
                         lastUpdateDate: "2021.04.02".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.imos.imos()!),
            Verification(title: "UIBezierPathを使って図形の描画をする",
                         lastUpdateDate: "2021.4.10".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.bezierPath.bezierPath()!),
            Verification(title: "UIPageViewControllerを使ってスワイプで画面切り替えを行う",
                         lastUpdateDate: "2021.4.14".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.swipePage.swipePage()!),
            Verification(title: "UITableViewCell選択時にCellにアニメーションをかける",
                         lastUpdateDate: "2021.4.17".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.fadeAnimationList.fadeAnimationList()!),
            Verification(title: "2回タップで2点を対角線とする四角形のUIViewを作る",
                         lastUpdateDate: "2021.04.23".date(format: .yyyyMMddPd),
                         viewController: R.storyboard.squareCanvas.squareCanvas()!)
        ]

        // TODO: 遷移先のVC内でHealthKitが利用かどうか判断するほうが良さそう
        // -> HealthKitをワークアウト取得以外の箇所でimportしたくない
        if HKHealthStore.isHealthDataAvailable() {
            let verification = Verification(title: "HealthKitを使ってワークアウトのデータを取り扱う",
                                            lastUpdateDate: "2021.4.18".date(format: .yyyyMMddPd),
                                            viewController: R.storyboard.workout.workout()!)
            viewModels?.append(verification)
        }

        viewModels?.sort(by: { (lve, rve) -> Bool in
            return lve.lastUpdateDate < rve.lastUpdateDate
        })

    }

    private func configureNavigationItem() {
        navigationItem.title = "Verifications"
        configureLeftBarButtonItem()
        configureRightBarButtonItem()
    }

    private func configureLeftBarButtonItem() {
        let backButton = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backView))
        navigationItem.leftBarButtonItem = backButton

    }

    @objc private func backView() {
        let transition = CATransition()
        transition.type = .push
        transition.duration = 0.5
        transition.subtype = .fromLeft
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }

    private func configureRightBarButtonItem() {
        func configureMenuElements() -> [UIMenuElement] {
            var children = [UIMenuElement]()

            let sortAscendingDateAction = UIAction(title: "最終更新日 昇順") { [unowned self] _ in
                self.viewModels?.sort(by: { (lve, rve) -> Bool in
                    return lve.lastUpdateDate < rve.lastUpdateDate
                })
            }
            children.append(sortAscendingDateAction)

            let sortDescendingDateAction = UIAction(title: "最終更新日 降順") { [unowned self] _ in
                self.viewModels?.sort(by: { (lve, rve) -> Bool in
                    return lve.lastUpdateDate > rve.lastUpdateDate
                })
            }
            children.append(sortDescendingDateAction)

            let sortAscendingTitle = UIAction(title: "タイトル 昇順") { [unowned self] _ in
                self.viewModels?.sort(by: { (lve, rve) -> Bool in
                    return lve.title < rve.title
                })
            }
            children.append(sortAscendingTitle)

            let sortDescendingTitle = UIAction(title: "タイトル 降順") { [unowned self] _ in
                self.viewModels?.sort(by: { (lve, rve) -> Bool in
                    return lve.title > rve.title
                })
            }
            children.append(sortDescendingTitle)

            return children
        }

        let children = configureMenuElements()
        let menu = UIMenu(title: "ソートする",
                          image: nil,
                          options: .displayInline,
                          children: children)
        let menuBarButtonItem = UIBarButtonItem(image: R.image.sort()?.withRenderingMode(.alwaysOriginal),
                                                menu: menu)
        navigationItem.rightBarButtonItem = menuBarButtonItem
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
