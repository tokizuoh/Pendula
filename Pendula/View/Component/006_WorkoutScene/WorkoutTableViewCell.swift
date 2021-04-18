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
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension WorkoutTableViewCell {

    func configureLabels(totalDistance: String,
                         totalEnergyBurned: String,
                         startDate: String,
                         endDate: String) {
        totalDistanceLabel.text = totalDistance
        totalEnergyBurnedLabel.text = totalEnergyBurned
        startDateLabel.text = startDate
        endDateLabel.text = endDate
    }

}
