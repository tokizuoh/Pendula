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

    struct ViewModel {
        let tital: String
        let drawHandler: (_ rect: CGRect) -> Void
    }

    var viewModels: [ViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "003_BezierPath",
                                blogURL: nil,
                                githubPRURL: nil)
        configureViewModels()
    }

}

extension BezierPathViewController {

    private func configureViewModels() {
        viewModels = [
            ViewModel(tital: "三角形",
                      drawHandler: { rect in
                        let path = UIBezierPath()
                        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
                        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                        path.close()
                        UIColor.red.setStroke()
                        path.stroke()
                      }),
            ViewModel(tital: "ひし形",
                      drawHandler: { rect in
                        let path = UIBezierPath()
                        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
                        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY / 2))
                        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + rect.midY / 2))
                        path.close()
                        UIColor.red.setStroke()
                        path.stroke()
                      })
        ]
    }

}

extension BezierPathViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = viewModels,
              viewModels.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bezierPathTableViewCell, for: indexPath)!
        cell.titleLabel.text = viewModels[indexPath.row].tital
        cell.drawHandler = viewModels[indexPath.row].drawHandler
        return cell
    }

}

extension BezierPathViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BezierPathTableViewCell().cellHeight
    }

}
