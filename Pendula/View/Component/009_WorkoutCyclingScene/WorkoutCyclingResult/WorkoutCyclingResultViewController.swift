//
//  WorkoutCyclingResultViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit

final class WorkoutCyclingResultViewController: UIViewController {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self

            func configureTableViewHeader() {
                let xib = UINib(nibName: WorkoutCyclingResultHeaderView.nibName, bundle: nil)
                tableView.register(xib,
                                   forHeaderFooterViewReuseIdentifier: WorkoutCyclingResultHeaderView.nibName)
            }
            configureTableViewHeader()

            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    struct ViewModel {
        var startDate: String
        var endDate: String
        var totalDistance: Double
        var cyclingWorkouts: [CyclingWorkoutViewModel]
    }

    struct CyclingWorkoutViewModel {
        var totalDistance: String
        var totalTime: String
        var date: String
    }

    var viewModel: ViewModel? {
        didSet {
            for i in viewModel!.cyclingWorkouts {
                print(i)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // optional chaining より、UI要素に使うデータが確立したタイミングで更新したほうがnilのときのことを考えなくて良いので良さそう
        durationLabel.text = String(format: "%@ - %@", viewModel?.startDate ?? "?", viewModel?.endDate ?? "?")
        configureNavigationItem()
    }
}

extension WorkoutCyclingResultViewController {

    private func configureNavigationItem() {
        navigationItem.title = "009 WorkoutCycling"
        let backButtonItem = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                             style: .plain,
                                             target: self,
                                             action: #selector(popViewController))
        navigationItem.leftBarButtonItem = backButtonItem
    }

    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }

}

extension WorkoutCyclingResultViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cyclingWorkouts.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel?.cyclingWorkouts[indexPath.row].date
        cell.detailTextLabel?.text = "\(viewModel?.cyclingWorkouts[indexPath.row].totalDistance ?? "?") km"
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return cell
    }

}

extension WorkoutCyclingResultViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WorkoutCyclingResultHeaderView.nibName) as! WorkoutCyclingResultHeaderView
        header.tintColor = .clear
        header.setup(totalDistance: String(format: "%.2f km", viewModel?.totalDistance ?? "0"))
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WorkoutCyclingResultHeaderView.height
    }

}
