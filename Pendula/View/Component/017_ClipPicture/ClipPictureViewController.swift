//
//  ClipPictureViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/11/21.
//

import UIKit

final class ClipPictureViewController: ComponentBaseViewController {

    @IBOutlet weak var baseImageView: UIImageView! {
        didSet {
            baseImageView.image = R.image.clip_picture_fugaku()
        }
    }

    @IBOutlet weak var clippedImageView: UIImageView! {
        didSet {
            clippedImageView.backgroundColor = .lightGray
            clippedImageView.contentMode = .scaleAspectFill
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "017 Clip Picture")
    }

    @IBAction func clip(_ sender: Any) {
        guard let targetImage = baseImageView.image,
              let targetCGImage = targetImage.cgImage else {
            return
        }

        let clippingWidth = clippedImageView.frame.width
        let clippingHeight = clippedImageView.frame.height

        let availableX = targetImage.size.width - clippingWidth
        let availableY = targetImage.size.height - clippingHeight

        let x = CGFloat.random(in: 0..<availableX)
        let y = CGFloat.random(in: 0..<availableY)

        let clippingRect = CGRect(x: x,
                                  y: y,
                                  width: x + clippingWidth,
                                  height: y + clippingHeight)

        guard let clippedCGImage = targetCGImage.cropping(to: clippingRect) else {
            return
        }
        let crippedImage = UIImage(cgImage: clippedCGImage)
        clippedImageView.image = crippedImage
    }
}
