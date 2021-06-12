//
//  RotatingCollectionViewViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/06/12.
//

import UIKit

final class RotatingCollectionViewViewController: ComponentBaseViewController {

    @IBOutlet weak var foundationView: UIView! {
        didSet {
            foundationView.layer.cornerRadius = foundationView.bounds.width / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "012 RotatingCollectionView",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}

final class RotatingCollectionViewComponentViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let screenSize: CGSize = UIScreen.main.bounds.size

        let sideMargin: CGFloat = 30
        let cellCountsPerRow: CGFloat = 5
        let cellLineSpacing: CGFloat = 5

        let cellWidth: CGFloat = screenSize.width - (sideMargin * 2 + (cellCountsPerRow - 1) * cellLineSpacing)
        let cellHeight: CGFloat = cellWidth * 16 / 9

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellLineSpacing
        layout.minimumInteritemSpacing = cellLineSpacing
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: screenSize.width,
                                                            height: screenSize.height),
                                              collectionViewLayout: layout)
        collectionView.register(R.nib.rotatingCollectionViewCell)
        return collectionView
    }()

    override func viewDidLoad() {
        collectionView.dataSource = self
    }

}

extension RotatingCollectionViewComponentViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.rotatingCollectionViewCell,
                                                      for: indexPath)!

        return cell
    }

}
