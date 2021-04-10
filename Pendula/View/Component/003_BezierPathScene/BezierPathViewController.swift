//
//  BezierPathViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/10.
//

import UIKit

final class BezierPathViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(R.nib.bezierPathTableViewCell)
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "003_BezierPath",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}

extension BezierPathViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bezierPathTableViewCell, for: indexPath)!
        return cell
    }

}

extension BezierPathViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BezierPathTableViewCell().cellHeight
    }

}
