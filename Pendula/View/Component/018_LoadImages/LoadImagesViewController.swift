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

    struct ViewControllerModel {
        let thumbnailImages: [UIImage?]
    }

    private var viewControllerModel: ViewControllerModel?
    var presenter: LoadImagesPresenter!
    private let cellCount = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "018 LoadImages")
        collectionView.isHidden = true
        presenter.getImages()
    }

}

extension LoadImagesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewControllerModel = viewControllerModel else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.loadImagesCollectionViewCell,
                                                      for: indexPath)!
        let index = indexPath.row % viewControllerModel.thumbnailImages.count
        let image = viewControllerModel.thumbnailImages[index]
        cell.setup(image: image)
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

extension LoadImagesViewController: LoadImagesPresenterOutput {

    func updateViewControllerModel(_ viewControllerModel: ViewControllerModel) {
        self.viewControllerModel = viewControllerModel
        collectionView.isHidden = false
        collectionView.reloadData()
    }

}
