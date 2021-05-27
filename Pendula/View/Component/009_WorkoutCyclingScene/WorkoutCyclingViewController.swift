//
//  WorkoutCyclingViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit
import HealthKit

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
        var totalDistance: Double
    }

    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.startDateLabel.text = viewModel.startDate.string(format: .yyyyMMddPd)
                self.endDateLabel.text = viewModel.endDate.string(format: .yyyyMMddPd)
            }
        }
    }

    var healthStore: HKHealthStore?
    var workouts: [HKWorkout]? {
        didSet {
            guard let workouts = workouts else {
                return
            }
            updateViewModel(workouts: workouts)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "009 WorkoutCycling",
                                blogURL: nil,
                                githubPRURL: nil)
        configureHelathStore()
    }

    @IBAction func go(_ sender: Any) {
        guard let viewModel = viewModel else {
            return
        }
        let vc = R.storyboard.workoutCyclingResult.workoutCyclingResult()!
        vc.viewModel = WorkoutCyclingResultViewController.ViewModel(startDate: viewModel.startDate.string(format: .yyyyMMddPd),
                                                                    endDate: viewModel.endDate.string(format: .yyyyMMddPd),
                                                                    totalDistance: viewModel.totalDistance)
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

}

// MARK: - HealthKit
extension WorkoutCyclingViewController {

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
        let predicate = HKQuery.predicateForWorkouts(with: .cycling)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                              ascending: false)
        let query = HKSampleQuery(sampleType: type,
                                  predicate: predicate,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: [sortDescriptor]) { _, samples, error in
            guard let workouts = samples as? [HKWorkout],
                  error == nil else {
                return
            }
            self.workouts = workouts.sorted(by: { (lw, rw) -> Bool in
                lw.startDate < rw.startDate
            })
        }
        healthStore?.execute(query)
    }

}

// MARK: - UI
extension WorkoutCyclingViewController {

    private func updateViewModel(workouts: [HKWorkout]) {
        // FIXME: エラー潰してる
        guard workouts.count > 0 else {
            return
        }

        let totalDistance = workouts.map({ (workout: HKWorkout) -> Double in
            workout.totalDistance!.doubleValue(for: .meter()) / 1000
        }).reduce(0) {$0 + $1}

        viewModel = ViewModel(startDate: workouts.first!.startDate,
                              endDate: workouts.last!.endDate,
                              totalDistance: totalDistance)
    }
}
