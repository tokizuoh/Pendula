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
    var workouts: [HKWorkout]? {
        didSet {

            print(workouts)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "006 Workout",
                                blogURL: nil,
                                githubPRURL: nil)
        configureHelathStore()
        getWorkouts()
    }

}

extension WorkoutViewController {

    private func configureHelathStore() {
        healthStore = HKHealthStore()

        let allTypes = Set([
            HKObjectType.workoutType()
        ])

        healthStore?.requestAuthorization(toShare: nil, read: allTypes) { success, _ in
            guard success else {
                return
            }

            self.getWorkouts()
        }
    }

    private func getWorkouts() {
        let type = HKWorkoutType.workoutType()
        let predicate = HKQuery.predicateForWorkouts(with: .walking)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: type,
                                  predicate: predicate,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: [sortDescriptor]) { _, samples, error in
            guard let workouts = samples as? [HKWorkout],
                  error == nil else {
                return
            }
            self.workouts = workouts
        }
        healthStore?.execute(query)
    }

}
