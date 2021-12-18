//
//  LoadImagesPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/11/27.
//

import Foundation

protocol LoadImagesPresenter {
    init(output: LoadImagesPresenterOutput,
         cacher: LoadImagesCacher,
         urlGenerator: LoadImagesURLGenerator)
    func getImageDataList()
}

final class LoadImagesPresenterImplement: LoadImagesPresenter {

    private weak var output: LoadImagesPresenterOutput?
    private let cacher: LoadImagesCacher
    private let urlGenerator: LoadImagesURLGenerator

    private let urlCounts = 47

    init(output: LoadImagesPresenterOutput,
         cacher: LoadImagesCacher,
         urlGenerator: LoadImagesURLGenerator) {
        self.output = output
        self.cacher = cacher
        self.urlGenerator = urlGenerator
    }

    func getImageDataList() {
        let urls = urlGenerator.generate(count: urlCounts)

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
