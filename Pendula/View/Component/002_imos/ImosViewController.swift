//
//  ImosViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/02.
//

import UIKit

final class ImosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            configureLayout()
        }
    }

    private let itemCountPerRow: CGFloat = 7
    private let itemSpacing: CGFloat = 5
    private let topMargin: CGFloat = 10
    private let bottomMargin: CGFloat = 10
    private let sideMargin: CGFloat = 25
    private let cellBorderWidth: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }

}

// TODO: 共通化
extension ImosViewController {
    private func setupNavigationItem() {
        navigationItem.title = "002_Imos"
        let backButton = UIBarButtonItem(image: R.image.back_arrow()?.withRenderingMode(.alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(popViewController))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: UICollectionViewFlowLayout
extension ImosViewController {

    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: topMargin,
                                           left: sideMargin,
                                           bottom: bottomMargin,
                                           right: sideMargin)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        collectionView.collectionViewLayout = layout
    }

}

extension ImosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(itemCountPerRow * itemCountPerRow)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = cellBorderWidth
        return cell
    }

}

extension ImosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - sideMargin * 2 - itemSpacing * (itemCountPerRow - 1)
        let cellWidth = availableWidth / itemCountPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }

}
