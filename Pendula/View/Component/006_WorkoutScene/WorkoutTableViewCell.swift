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
    @IBOutlet weak var durationLabel: UILabel!

}

extension WorkoutTableViewCell {

    func configureLabels(totalDistance: String,
                         totalEnergyBurned: String,
                         duration: String) {
        totalDistanceLabel.text = totalDistance
        totalEnergyBurnedLabel.text = totalEnergyBurned
        durationLabel.text = duration
    }

}
