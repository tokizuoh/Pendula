//
//  WorkoutCyclingResultViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit

final class WorkoutCyclingResultViewController: UIViewController {

    @IBOutlet weak var totalDistanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    struct ViewModel {
        var startDate: String
        var endDate: String
        var totalDistance: Double
    }

    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // optional chaining より、UI要素に使うデータが確立したタイミングで更新したほうがnilのときのことを考えなくて良いので良さそう
        totalDistanceLabel.text = String(format: "%.2f", viewModel?.totalDistance ?? 0) + "km"
        durationLabel.text = String(format: "%@ - %@", viewModel?.startDate ?? "?", viewModel?.endDate ?? "?")
    }
}
