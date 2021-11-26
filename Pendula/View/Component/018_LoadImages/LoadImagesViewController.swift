//
//  LoadImagesViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/11/26.
//

import UIKit

final class LoadImagesViewController: ComponentBaseViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(R.nib.loadImagesCollectionViewCell)
            configureFlowLayout()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "018 LoadImages")
    }

}

extension LoadImagesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: [#104] 画像の枚数の変数に変更
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.loadImagesCollectionViewCell,
                                                      for: indexPath)!
        return cell
    }

    private func configureFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: collectionView.frame.width,
                                height: collectionView.frame.height)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }

}
