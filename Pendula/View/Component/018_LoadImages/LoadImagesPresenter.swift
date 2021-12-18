//
//  LoadImagesPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/11/27.
//

import Foundation

protocol LoadImagesPresenter {
    init(output: LoadImagesPresenterOutput,
         cacher: LoadImagesCacher)
    func getImageDataList()
}

final class LoadImagesPresenterImplement: LoadImagesPresenter {

    private weak var output: LoadImagesPresenterOutput?
    private let cacher: LoadImagesCacher

    init(output: LoadImagesPresenterOutput,
         cacher: LoadImagesCacher) {
        self.output = output
        self.cacher = cacher
    }

    func getImageDataList() {
        let urls = getURLs()

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

extension LoadImagesPresenterImplement {

    func getURLs() -> [URL] {
        return [
            URL(string: "https://placehold.jp/edbcaf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/bbefba/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/cfdedc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ccebdf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/edcffc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/bdddcb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/eccfca/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/faebed/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/caadfb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/baeefa/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/fccddf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/fabfca/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/baaceb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ededeb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/adfafe/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/abdbfc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/bcbbca/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/aceeaf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/fecaec/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/abaadd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/aeadfd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/edacae/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/adfcdf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ccbcea/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/aeddec/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/dcfdee/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/beffdf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/bdfecd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/aeffff/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/acaacc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ecacfd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/cdeeca/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/feecaf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/dcecce/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/aabada/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ccfefd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/edaeed/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/feffcb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/abcfdc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/dabbdc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/afdbbc/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ddeebf/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/adceeb/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/badabe/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/ebfece/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/fbcaab/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!,
            URL(string: "https://placehold.jp/debadd/ffffff/1000x2000.png?text=1000%20%C3%97%202000")!
        ]
    }

}

protocol LoadImagesPresenterOutput: AnyObject {
    func updateViewControllerModel(_ viewControllerModel: LoadImagesViewController.ViewControllerModel)
}
