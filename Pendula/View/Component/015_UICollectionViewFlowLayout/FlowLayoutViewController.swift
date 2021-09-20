//
//  FlowLayoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/20.
//

import UIKit

final class FlowLayoutViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            func configureLayout() -> UICollectionViewLayout {
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = .init(width: 75, height: 50)
                layout.minimumInteritemSpacing = 75
                layout.minimumLineSpacing = 50
                layout.sectionInset = .init(top: 10,
                                            left: 5,
                                            bottom: 10,
                                            right: 10)
                return layout
            }

            collectionView.dataSource = self
            collectionView.collectionViewLayout = configureLayout()
        }
    }

    private let itemCount: Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FlowLayoutViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.flowLayoutCell.identifier,
                                                      for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }

}
