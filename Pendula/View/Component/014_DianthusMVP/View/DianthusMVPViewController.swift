//
//  DianthusMVPViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import UIKit

final class DianthusMVPViewController: ComponentBaseViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    var presenter: DianthusPresenterProtocol!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "014 Dianthus by MVP",
                                blogURL: nil,
                                githubPRURL: nil)
        configureCollectionView()
    }

    @IBAction func go(_ sender: Any) {
        guard let text = textField.text else {
            return
        }

        presenter.fetchWordList(from: text)
    }

}

// MARK: - Configure UICollectionView
extension DianthusMVPViewController {

    enum Section: Hashable {
        case main
    }

    struct Item: Hashable {
        private let identifier = UUID()
        let word: Word
    }

    private func configureCollectionView() {
        configureCollectionViewLayout()
        configureCollectionViewDataSource()
    }

    private func configureCollectionViewLayout() {
        var layoutConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
        layoutConfiguration.headerMode = .none
        let layout = UICollectionViewCompositionalLayout.list(using: layoutConfiguration)
        collectionView.collectionViewLayout = layout
    }

    private func configureCollectionViewDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.word.raw
            contentConfiguration.secondaryText = "\(item.word.roman) [\(item.word.vowels)]"
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
    }

}

// MARK: - Update UICollectionView Items
extension DianthusMVPViewController {

    func update(_ items: [Item], in section: Section) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }

}

extension DianthusMVPViewController: DianthusPresenterOutputProtocol {

    func updateItems(_ items: [Item]) {
        update(items, in: .main)
    }

    func handleError(_ error: DianthusError) {
        // TODO [#86] エラーハンドリング: エラーをユーザーに伝える or 何もしない
    }

}
