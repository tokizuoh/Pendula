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
            collectionView.register(R.nib.imosCollectionViewCell)
            configureLayout()
        }
    }
    @IBOutlet weak var imosButton: UIButton!

    // MARK: UICollectionView Property
    private let itemCountPerRow: CGFloat = 7
    private let itemSpacing: CGFloat = 5
    private let topMargin: CGFloat = 2.5
    private let bottomMargin: CGFloat = 2.5
    private let sideMargin: CGFloat = 25

    private lazy var imosManager = ImosManager(cellCount: Int(itemCountPerRow))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem(navigationTitle: "002_Imos",
                            blogURL: URL(string: "https://tokizuoh.dev/posts/x3i7hx6idotanxen/"),
                            githubPRURL: URL(string: "https://github.com/tokizuoh/Pendula/pull/36"))
        imosButton.setTitle("Show Result", for: .normal)
    }

    @IBAction func showResult(_ sender: Any) {
        switch imosManager.state {
        case .processing:
            imosManager.calculate()
            updateAppearanceCells(state: .processing)
            imosButton.setTitle("Refresh", for: .normal)
        case .doneCalculate:
            updateAppearanceCells(state: .doneCalculate)
            imosButton.setTitle("Show Result", for: .normal)
            imosManager.refresh()
        }
    }

    private func updateAppearanceCells(state: ImosManager.State) {
        for i in 0..<Int(itemCountPerRow) {
            let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? ImosCollectionViewCell
            switch state {
            case .processing:
                cell?.countLabel.text = "\(imosManager.calculatedCounts[i + 1])"
                cell?.backgroundColor = .black
            case .doneCalculate:
                cell?.countLabel.text = ""
                cell?.backgroundColor = .darkGray
            }
        }
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
        collectionView.collectionViewLayout = layout
    }

}

extension ImosViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(itemCountPerRow)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.imosCollectionViewCell,
                                                      for: indexPath)!
        cell.backgroundColor = .darkGray
        return cell
    }

}

extension ImosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let beforeIndexPath = imosManager.indexPath {
            guard beforeIndexPath.row < indexPath.row else {
                return
            }

            alphaCell(indexPath: indexPath, alpha: 0.5)

            imosManager.update(li: beforeIndexPath.row, ri: indexPath.row)
            imosManager.indexPath = nil

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.alphaCell(indexPath: beforeIndexPath, alpha: 1.0)
                self?.alphaCell(indexPath: indexPath, alpha: 1.0)
            }
        } else {
            alphaCell(indexPath: indexPath, alpha: 0.5)
            imosManager.indexPath = indexPath
        }
    }

    private func alphaCell(indexPath: IndexPath, alpha: CGFloat) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.alpha = alpha
    }

}

extension ImosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - sideMargin * 2 - itemSpacing * (itemCountPerRow - 1)
        let cellWidth = availableWidth / itemCountPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }

}
