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
            collectionView.delegate = self
            collectionView.decelerationRate = .fast
            collectionView.register(R.nib.loadImagesCollectionViewCell)
        }
    }

    struct ViewControllerModel {
        let thumbnailImages: [UIImage?]
    }

    private var viewControllerModel: ViewControllerModel?
    var presenter: LoadImagesPresenter!
    private lazy var flowLayout = LoadImagesFlowLayout()
    private lazy var activityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "018 LoadImages")
        collectionView.isHidden = true
        configureIndicator()
        activityIndicatorView.startAnimating()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureFlowLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getImages()
    }

}

extension LoadImagesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllerModel?.thumbnailImages.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewControllerModel = viewControllerModel else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.loadImagesCollectionViewCell,
                                                      for: indexPath)!
        let index = indexPath.row % viewControllerModel.thumbnailImages.count
        let image = viewControllerModel.thumbnailImages[index]
        let laps = indexPath.row / viewControllerModel.thumbnailImages.count
        cell.setup(viewModel: .init(image: image,
                                    rowText: indexPath.row.description,
                                    lapText: laps.description))
        return cell
    }

}

extension LoadImagesViewController: LoadImagesPresenterOutput {

    func updateViewControllerModel(_ viewControllerModel: ViewControllerModel) {
        self.viewControllerModel = viewControllerModel
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
        collectionView.isHidden = false
        collectionView.reloadData()
    }

}

// MARK: - Configure UICollectionView's Layout
extension LoadImagesViewController {

    private func configureFlowLayout() {
        let layout = flowLayout
        layout.itemSize = .init(width: collectionView.frame.width,
                                height: collectionView.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }

}

// MARK: - Configure UIActivityIndicatorView
extension LoadImagesViewController {

    private func configureIndicator() {
        activityIndicatorView.center = view.center
        view.addSubview(activityIndicatorView)
    }

}

extension LoadImagesViewController: UICollectionViewDelegateFlowLayout {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        flowLayout.prepareForPaging()
    }

}
