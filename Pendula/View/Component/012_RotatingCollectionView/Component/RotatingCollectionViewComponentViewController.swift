//
//  RotatingCollectionViewComponentViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/06/12.
//

import UIKit

// swiftlint:disable type_name
final class RotatingCollectionViewComponentViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(R.nib.rotatingCollectionViewCell)
        }
    }

    override func viewDidLoad() {
        setupCollectionView()
    }

}

extension RotatingCollectionViewComponentViewController {

    private func setupCollectionView() {
        let sideMargin: CGFloat = 30
        let cellCountsPerRow: CGFloat = 5
        let cellLineSpacing: CGFloat = 2

        let cellWidth: CGFloat = (view.bounds.width - (sideMargin * 2 + (cellCountsPerRow - 1) * cellLineSpacing)) / cellCountsPerRow
        let cellHeight: CGFloat = cellWidth * 86 / 59

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellLineSpacing
        layout.minimumInteritemSpacing = cellLineSpacing
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        collectionView.collectionViewLayout = layout
    }
}

extension RotatingCollectionViewComponentViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.rotatingCollectionViewCell,
                                                      for: indexPath)!
        cell.backgroundColor = (indexPath.row % 2 == 0 ? R.color.bamboo_dark() : R.color.bamboo_light())
        return cell
    }

}
