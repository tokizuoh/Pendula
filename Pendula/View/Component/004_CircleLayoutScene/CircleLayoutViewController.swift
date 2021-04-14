//
//  CircleLayoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/11.
//

import UIKit

final class CircleLayoutViewController: ComponentBaseViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(R.nib.circleLayoutCollectionViewCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "004 CircleLayout",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}

extension CircleLayoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.circleLayoutCollectionViewCell,
                                                      for: indexPath)!
        cell.backgroundColor = .blue
        return cell
    }

}

final class CircleCollectionViewLayout: UICollectionViewLayout {
    let itemSize: CGSize = CGSize(width: 120, height: 160)

    // TODO: 何の変数？
    var angleAtExtreme: CGFloat {
        // TODO: どういう計算をしている？
        guard let collectionView = collectionView,
              collectionView.numberOfItems(inSection: 0) > 0 else {
            return 0
        }
        return anglePerItem * CGFloat(-1 * collectionView.numberOfItems(inSection: 0) + 1)
        //        return collectionView!.numberOfItems(inSection: 0) > 0 ? -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
    }
    var angle: CGFloat {
        // TODO: 何？
        print(collectionView!.contentOffset.x, collectionView!.contentSize.width, collectionView!.bounds.width)
        return angleAtExtreme * collectionView!.contentOffset.x / collectionViewContentSize.width - collectionView!.bounds.width
    }

    var radius: CGFloat = 500 {
        didSet {
            // TODO: どのタイミングで呼ばれる？
            invalidateLayout()
        }
    }

    var anglePerItem: CGFloat {
        // TODO: anglePerItem can be any value you want, but this formula ensures that the cells aren’t spread too far apart.
        return atan(itemSize.width / radius)
    }

    var attributesList = [CircleCollectionViewLayoutAttributes]()

    // TODO: これなんだ？
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return .zero
        }

        return CGSize(width: CGFloat(collectionView.numberOfItems(inSection: 0)) * itemSize.width,
                      height: collectionView.bounds.height)
    }

    // TODO
    override class var layoutAttributesClass: AnyClass {
        return CircleCollectionViewLayoutAttributes.self
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else {
            return
        }

        // collectionViewの画面左端
        let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2.0

        // unit coordinate space = itemSizeのwidth, heightをそれぞれ1とした場合の位置、なので最後にitemSize.heightで割る必要がある
        let anchorPointY = (itemSize.height / 2 + radius) / itemSize.height
        //        let anchorPointY = (itemSize.height / 2 + radius)

        attributesList = (0..<collectionView.numberOfItems(inSection: 0)).map { i in
            let attributes = CircleCollectionViewLayoutAttributes(forCellWith: IndexPath(row: i, section: 0))
            attributes.size = self.itemSize
            attributes.center = CGPoint(x: centerX,
                                        y: collectionView.bounds.midY)
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            //            attributes.angle = self.anglePerItem * CGFloat(i)
            attributes.angle = self.angle + self.anglePerItem * CGFloat(i)
            return attributes
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard attributesList.indices.contains(indexPath.row) else {
            return nil
        }
        return attributesList[indexPath.row]
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

final class CircleCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            //            zIndex = Int(angle * 100000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    override func copy(with zone: NSZone? = nil) -> Any {
        let attributes = super.copy(with: zone) as! CircleCollectionViewLayoutAttributes
        attributes.anchorPoint = anchorPoint
        attributes.angle = angle
        return attributes
    }
}
