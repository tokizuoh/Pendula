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
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "017 Clip Picture")
    }

}
