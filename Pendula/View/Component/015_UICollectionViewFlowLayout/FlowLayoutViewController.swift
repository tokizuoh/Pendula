//
//  FlowLayoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/20.
//

import UIKit

final class FlowLayoutViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let colors: [UIColor] = [
        .red, .blue, .yellow,
        .brown, .black, .cyan,
        .green, .orange, .purple
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }

}

extension FlowLayoutViewController {

    private func configureCollectionView() {
        func configureLayout() -> UICollectionViewLayout {
            let itemSpacing: CGFloat = 20
            let itemCountPerRow: CGFloat = 3
            let cellWidth: CGFloat = (view.bounds.width - (itemCountPerRow - 1) * itemSpacing) / itemCountPerRow - 0.1
            let cellSize = CGSize(width: cellWidth, height: cellWidth)

            let layout = UICollectionViewFlowLayout()
            layout.itemSize = cellSize
            layout.minimumLineSpacing = itemSpacing
            layout.minimumInteritemSpacing = itemSpacing
            return layout
        }

        collectionView.dataSource = self
        collectionView.collectionViewLayout = configureLayout()
    }

}

extension FlowLayoutViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.flowLayoutCell.identifier,
                                                      for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }

}
