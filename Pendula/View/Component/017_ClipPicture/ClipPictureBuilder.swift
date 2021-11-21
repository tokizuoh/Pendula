//
//  ClipPictureBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/11/21.
//

import Foundation

struct ClipPictureBuilder: Builder {

    typealias ViewController = ClipPictureViewController

    func build() -> ClipPictureViewController {
        let vc = R.storyboard.clipPicture.clipPicture()!
        return vc
    }

}
