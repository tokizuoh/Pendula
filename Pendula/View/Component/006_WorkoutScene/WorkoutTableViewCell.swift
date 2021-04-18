//
//  WorkoutTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/18.
//

import UIKit

final class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var totalDistanceLabel: UILabel!
    @IBOutlet weak var totalEnergyBurnedLabel: UILabel!
    @IBOutlet weak var durationDateLabel: UILabel!
    @IBOutlet weak var durationSecondsLabel: UILabel!
}

extension WorkoutTableViewCell {

    func configureLabels(totalDistance: String,
                         totalEnergyBurned: String,
                         durationDate: String,
                         durationSeconds: String) {
        totalDistanceLabel.text = totalDistance
        totalEnergyBurnedLabel.text = totalEnergyBurned
        durationDateLabel.text = durationDate
        durationSecondsLabel.text = durationSeconds
    }

}
