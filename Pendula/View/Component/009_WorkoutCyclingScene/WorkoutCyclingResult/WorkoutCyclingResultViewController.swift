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

        }
    }

    struct ViewModel {
        var startDate: String
        var endDate: String
        var totalDistance: Double
        var cyclingWorkouts: [CyclingWorkoutViewModel]
    }

    struct CyclingWorkoutViewModel {
        var totalDistance: Double
        var totalTime: Date
        var date: Date
        var averageSpeed: Double
    }

    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // optional chaining より、UI要素に使うデータが確立したタイミングで更新したほうがnilのときのことを考えなくて良いので良さそう
        durationLabel.text = String(format: "%@ - %@", viewModel?.startDate ?? "?", viewModel?.endDate ?? "?")
    }
}

extension WorkoutCyclingResultViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cyclingWorkouts.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

extension WorkoutCyclingResultViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WorkoutCyclingResultHeaderView.nibName) as! WorkoutCyclingResultHeaderView
        header.tintColor = .clear
        header.setup(totalDistance: "101010100km")
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WorkoutCyclingResultHeaderView.height
    }

}
