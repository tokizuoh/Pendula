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
        let clippedImage = clipImage(baseImageView.image,
                                     toWidth: clippedImageView.frame.width,
                                     toHeight: clippedImageView.frame.height)
        clippedImageView.image = clippedImage
    }

}

extension ClipPictureViewController {

    /// 画像を切り抜く
    /// - Parameters:
    ///   - from: 切り抜く対象の画像
    ///   - toWidth: 切り抜くWidth
    ///   - toHeight: 切り抜くHeight
    /// - Returns: 切り抜いたUIImage
    private func clipImage(_ from: UIImage?,
                           toWidth: CGFloat,
                           toHeight: CGFloat) -> UIImage? {
        guard let fromImage = from,
              let fromCGImage = fromImage.cgImage else {
            return nil
        }

        let availableX = fromImage.size.width - toWidth
        let availableY = fromImage.size.height - toHeight

        let x = CGFloat.random(in: 0..<availableX)
        let y = CGFloat.random(in: 0..<availableY)

        let clippingRect = CGRect(x: x,
                                  y: y,
                                  width: x + toWidth,
                                  height: y + toHeight)

        guard let clippedCGImage = fromCGImage.cropping(to: clippingRect) else {
            return nil
        }

        return UIImage(cgImage: clippedCGImage)
    }

}
