//
//  WorkoutCyclingViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/27.
//

import UIKit
import HealthKit

final class WorkoutCyclingViewController: ComponentBaseViewController {

    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateView: UIView!
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

    var totalDistance: Double?

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
            self.workouts = workouts.sorted(by: { (lw, rw) -> Bool in
                return lw.startDate > rw.startDate
            })
            updateViewModel(workouts: workouts)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "009 WorkoutCycling",
                                blogURL: URL(string: "https://tokizuoh.dev/posts/x01z649toqnxa8no/"),
                                githubPRURL: nil)
        configureTapEvent()
        configureHelathStore()
    }

    @IBAction func go(_ sender: Any) {
        guard let viewModel = viewModel,
              let workouts = workouts else {
            return
        }

        let workoutsFilteredByDate = workouts.filter { viewModel.startDate <= $0.startDate && $0.endDate <= viewModel.endDate}
        let cyclingWorkouts  = workoutsFilteredByDate.map { workout in WorkoutCyclingResultViewController.CyclingWorkoutViewModel(totalDistance: String(format: "%.2f", workout.totalDistance!.doubleValue(for: .meter()) / 1000),
                                                                                                                                  totalTime: workout.duration.description,
                                                                                                                                  date: workout.startDate.string(format: .yyyyMMddPd)) }
        let vc = R.storyboard.workoutCyclingResult.workoutCyclingResult()!
        vc.viewModel = WorkoutCyclingResultViewController.ViewModel(startDate: viewModel.startDate.string(format: .yyyyMMddPd),
                                                                    endDate: viewModel.endDate.string(format: .yyyyMMddPd),
                                                                    totalDistance: totalDistance ?? 0,
                                                                    cyclingWorkouts: cyclingWorkouts)
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }

}

// MARK: - Tap Event
extension WorkoutCyclingViewController {

    private func configureTapEvent() {
        let tapStartDateViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                       action: #selector(moveDateList))
        let tapEndDateViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                     action: #selector(moveDateList))
        startDateView.addGestureRecognizer(tapStartDateViewGestureRecognizer)
        endDateView.addGestureRecognizer(tapEndDateViewGestureRecognizer)
    }

    @objc private func moveDateList() {
        let vc = R.storyboard.workoutCyclingDateList.workoutCyclingDateList()!
        present(vc, animated: true, completion: nil)
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

    // TODO [feature/#71]: 命名は適切か？（ViewModel以外の更新を行っていないか？）
    private func updateViewModel(workouts: [HKWorkout]) {
        // FIXME: エラー潰してる
        guard workouts.count > 0 else {
            return
        }

        totalDistance = workouts.map({ (workout: HKWorkout) -> Double in
            workout.totalDistance!.doubleValue(for: .meter()) / 1000
        }).reduce(0) {$0 + $1}

        viewModel = ViewModel(startDate: workouts.first!.startDate,
                              endDate: workouts.last!.endDate)
    }
}
