//
//  LoadImagesPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/11/27.
//

import Foundation

protocol LoadImagesPresenter {
    init(output: LoadImagesPresenterOutput, cacher: LoadImagesCacher)
    func getImageDataList()
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

    func getImageDataList() {
        let images: [Data?] = urls.map {
            return getImageData(url: $0)
        }

        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.output?.updateViewControllerModel(.init(thumbnailImages: images))
        }
    }

    private func getImageData(url: URL) -> Data? {
        if let imageData = cacher.getCachedImageData(url) {
            return imageData

        } else {
            guard let imageData = try? Data(contentsOf: url) else {
                return nil
            }
            cacher.cacheImageData(url: url, imageData: imageData)
            return imageData
        }
    }

}

protocol LoadImagesPresenterOutput: AnyObject {
    func updateViewControllerModel(_ viewControllerModel: LoadImagesViewController.ViewControllerModel)
}
