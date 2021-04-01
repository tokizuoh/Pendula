//
//  IrregularLayoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/03/31.
//

import UIKit

final class IrregularLayoutViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.collectionViewLayout = configureLayout()
            collectionView.register(R.nib.irregularLayoutCollectionViewCell)
        }
    }

    private enum CollectionViewSection: Hashable {
        case main
    }

    private lazy var dataSource = configureCollectionViewDataSource()
    private lazy var irregularLayoutCellItems = IrregularLayoutCellItem.generateItems(count: itemCountPerSection)
    private lazy var columnFractionalWidth: CGFloat = 1.0 / CGFloat(itemCountPerRow)
    private let itemCountPerRow = 7
    private let itemCountPerSection = 35

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }

    @IBAction func generate(_ sender: Any) {
        func applySnapshot() {
            var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, IrregularLayoutCellItem>()
            snapshot.appendSections([.main])
            snapshot.appendItems(irregularLayoutCellItems)
            dataSource.apply(snapshot, animatingDifferences: false)
        }

        irregularLayoutCellItems = IrregularLayoutCellItem.generateItems(count: itemCountPerSection)
        collectionView.collectionViewLayout = configureLayout()
        applySnapshot()

    }

}

// TODO: 共通化
extension IrregularLayoutViewController {
    private func setupNavigationItem() {
        navigationItem.title = "001_IrregularLayout"
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

// MARK: DataSource
extension IrregularLayoutViewController {

    private func configureCollectionViewDataSource() -> UICollectionViewDiffableDataSource<CollectionViewSection, IrregularLayoutCellItem> {
        let dataSource = UICollectionViewDiffableDataSource<CollectionViewSection, IrregularLayoutCellItem>(collectionView: collectionView) { (collectionView, indexPath, irregularLayoutCellItem) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.irregularLayoutCollectionViewCell.identifier,
                                                          for: indexPath) as? IrregularLayoutCollectionViewCell
            cell?.item = irregularLayoutCellItem
            cell?.backgroundColor = (indexPath.row % 2 == 0 ? .red : .blue)
            return cell
        }
        return dataSource
    }

}

// MARK: NSCollectionLayout
extension IrregularLayoutViewController {

    private func configureLayout() -> UICollectionViewLayout {

        let group = configureLayoutGroup(items: irregularLayoutCellItems)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    private func configureLayoutGroup(items: [IrregularLayoutCellItem]) -> NSCollectionLayoutGroup {

        func configureColumns(items: [IrregularLayoutCellItem]) -> [IrregularLayoutCellItemColumn] {

            var itemColumns = [IrregularLayoutCellItemColumn]()

            for _ in 0..<itemCountPerRow {
                itemColumns.append(IrregularLayoutCellItemColumn(items: []))
            }

            for item in items {
                var minimumHeight = CGFloat.greatestFiniteMagnitude
                var minimumColumnIndex = 0

                for (index, itemColumn) in itemColumns.enumerated() {
                    let columnHeight = itemColumn.totalHeight
                    if columnHeight < minimumHeight {
                        minimumHeight = columnHeight
                        minimumColumnIndex = index
                    }
                }
                itemColumns[minimumColumnIndex].items.append(item)
            }

            return itemColumns
        }

        let columns: [IrregularLayoutCellItemColumn] = configureColumns(items: items)

        var columnLayoutGroups = [NSCollectionLayoutGroup]()
        for column in columns {

            var items = [NSCollectionLayoutItem]()
            column.items.forEach { item in
                let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                            heightDimension: .fractionalWidth(item.height))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
                items.append(layoutItem)
            }

            let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(columnFractionalWidth),
                                                         heightDimension: .fractionalWidth(column.totalHeight * columnFractionalWidth))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupLayoutSize,
                                                         subitems: items)

            columnLayoutGroups.append(group)
        }

        var maxHeight: CGFloat = .zero
        columns.forEach { column in
            let height = column.totalHeight * columnFractionalWidth
            if maxHeight < height {
                maxHeight = height
            }
        }

        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalWidth(maxHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize,
                                                       subitems: columnLayoutGroups)

        return group
    }
}
