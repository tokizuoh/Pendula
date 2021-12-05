//
//  LoadImagesCacher.swift
//  Pendula
//
//  Created by tokizo on 2021/12/05.
//

import UIKit

protocol LoadImagesCacher {
    /// 画像をキャッシュする
    func cacheImage(url: URL, image: UIImage)

    /// 画像がキャッシュされているか
    func hasCachedImage(_ url: URL) -> Bool
}

final class LoadImagesCacherImplement: LoadImagesCacher {

    private var imageDictionary: [URL: UIImage] = [:]

    static let shared = LoadImagesCacherImplement()

    private init() {}

    func cacheImage(url: URL, image: UIImage) {
        imageDictionary[url] = image
    }

    func hasCachedImage(_ url: URL) -> Bool {
        return imageDictionary.keys.contains(url)
    }

}
