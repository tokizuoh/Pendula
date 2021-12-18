//
//  LoadImagesBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/11/26.
//

import Foundation

struct LoadImagesBuilder: Builder {

    typealias ViewController = LoadImagesViewController

    func build() -> ViewController {
        let vc = R.storyboard.loadImages.loadImages()!
        let cacher = LoadImagesCacherImplement.shared
        let URLGenerator = LoadImagesURLGeneratorImplement()
        let presenter = LoadImagesPresenterImplement(output: vc,
                                                     cacher: cacher,
                                                     URLGenerator: URLGenerator)
        vc.presenter = presenter
        return vc
    }

}
