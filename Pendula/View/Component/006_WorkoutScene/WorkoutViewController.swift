//
//  WorkoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/18.
//

import UIKit
import HealthKit

final class WorkoutViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(R.nib.workoutTableViewCell)
        }
    }

    var activityIndicator: UIActivityIndicatorView!
    var healthStore: HKHealthStore?
    var workouts: [HKWorkout]? {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "006 Workout",
                                blogURL: nil,
                                githubPRURL: nil)
        configureActivityIndicator()
        configureHelathStore()
        getWorkouts()
    }

}

// MARK: - UIActivityIndicator
extension WorkoutViewController {

    private func configureActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0,
                                         y: 0,
                                         width: 50,
                                         height: 50)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

}

// MARK: - HealthKit
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

// MARK: - UITableViewDataSource
extension WorkoutViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let workouts = workouts,
              workouts.indices.contains(indexPath.row) else {
            // TODO: エラー表示用のセルを作る？
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.workoutTableViewCell, for: indexPath)!

        let workout = workouts[indexPath.row]
        cell.configureLabels(totalDistance: workout.totalDistance?.debugDescription ?? "",
                             totalEnergyBurned: workout.totalEnergyBurned?.description ?? "",
                             durationDate: generateDurationDateText(startDate: workout.startDate,
                                                                    endDate: workout.endDate),
                             durationSeconds: generateDurationSecondsText(startDate: workout.startDate,
                                                                          endDate: workout.endDate))
        return cell
    }

    private func generateDurationDateText(startDate: Date, endDate: Date) -> String {
        let startDateString = startDate.string(format: .yyyyMMddHHmmssPd)
        let endDateString = endDate.string(format: .yyyyMMddHHmmssPd)

        if startDateString.prefix(10) == endDateString.prefix(10) {
            return "\(startDateString) ~ \(endDateString.suffix(8))"
        } else {
            return "\(startDateString) ~ \(endDateString)"
        }
    }

    private func generateDurationSecondsText(startDate: Date, endDate: Date) -> String {
        let difference = endDate.timeIntervalSince(startDate)
        return "\(Int(difference / 60).description)m"
    }

}

// MARK: - UITableViewDelegate
extension WorkoutViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
