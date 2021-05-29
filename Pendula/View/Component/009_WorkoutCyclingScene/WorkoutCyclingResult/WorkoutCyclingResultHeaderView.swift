//
//  WorkoutCyclingResultHeaderView.swift
//  Pendula
//
//  Created by tokizo on 2021/05/29.
//

import UIKit

final class WorkoutCyclingResultHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var totalDistanceLabel: UILabel!

    static let nibName = "WorkoutCyclingResultHeaderView"
    static let height: CGFloat = 85

    func setup(totalDistance: String) {
        totalDistanceLabel.text = totalDistance
    }

}
