//
//  WorkoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/18.
//

import UIKit
import HealthKit

final class WorkoutViewController: ComponentBaseViewController {

    var healthStore: HKHealthStore?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "006 Workout",
                                blogURL: nil,
                                githubPRURL: nil)
        configureHelathStore()
    }

}

extension WorkoutViewController {

    private func configureHelathStore() {
        healthStore = HKHealthStore()

        let allTypes = Set([
            HKObjectType.workoutType()
        ])

        healthStore?.requestAuthorization(toShare: nil, read: allTypes) { success, _ in
            if success {
                print(1)
            } else {
                print(2)
            }
        }
    }

}
