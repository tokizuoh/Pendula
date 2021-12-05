//
//  LoadImagesPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/11/27.
//

import UIKit

protocol LoadImagesPresenter {
    init(output: LoadImagesPresenterOutput, cacher: LoadImagesCacher)
    func getImages()
}

final class LoadImagesPresenterImplement: LoadImagesPresenter {

    private weak var output: LoadImagesPresenterOutput?
    private let cacher: LoadImagesCacher

    private let urls: [URL] = [
        URL(string: "https://placehold.jp/7276c4/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
        URL(string: "https://tokizuoh.dev")!,  // 画像のfetchが必ず失敗するURL
        URL(string: "https://placehold.jp/a4b562/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
        URL(string: "https://placehold.jp/b56262/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
        URL(string: "https://placehold.jp/b262b5/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
        URL(string: "https://placehold.jp/6297b5/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
        URL(string: "https://raw.githubusercontent.com/tokizuoh/Pendula/feature/%23104/Pendula/View/Component/018_LoadImages/Image/sky.jpeg")!
    ]

    init(output: LoadImagesPresenterOutput, cacher: LoadImagesCacher) {
        self.output = output
        self.cacher = cacher
    }

    func getImages() {
        let images: [UIImage?] = urls.map {
            return getImage(url: $0)
        }

        output?.updateViewControllerModel(.init(thumbnailImages: images))
    }

    private func getImage(url: URL) -> UIImage? {
        if let image = cacher.getCachedImage(url) {
            return image

        } else {
            guard let image = fetchImage(url: url) else {
                return nil
            }
            cacher.cacheImage(url: url, image: image)
            return image
        }
    }

    private func fetchImage(url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }

        return .init(data: data)
    }

}

protocol LoadImagesPresenterOutput: AnyObject {
    func updateViewControllerModel(_ viewControllerModel: LoadImagesViewController.ViewControllerModel)
}
