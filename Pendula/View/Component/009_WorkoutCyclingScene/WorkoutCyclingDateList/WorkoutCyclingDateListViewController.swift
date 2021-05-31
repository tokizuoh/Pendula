//
//  WorkoutCyclingDateListViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit

final class WorkoutCyclingDateListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }

    struct ViewModel {
        var dateList: [Date]
    }

    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension WorkoutCyclingDateListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dateList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let date = viewModel?.dateList[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = date.string(format: .yyyyMMddPd)
        return cell
    }

}
