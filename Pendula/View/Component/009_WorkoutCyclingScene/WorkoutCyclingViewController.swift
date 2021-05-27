//
//  WorkoutCyclingViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit

final class WorkoutCyclingViewController: ComponentBaseViewController {

    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var goButton: UIButton! {
        didSet {
            goButton.layer.cornerRadius = 4.0
        }
    }

    struct ViewModel {
        var startDate: Date
        var endDate: Date
    }

    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            startDateLabel.text = viewModel.startDate.string(format: .yyyyMMddPd)
            endDateLabel.text = viewModel.endDate.string(format: .yyyyMMddPd)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "009 WorkoutCycling",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}
