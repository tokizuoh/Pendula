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

    /// キャッシュ済みの画像を返す（存在しない場合はnilを返す）
    func getCachedImage(_ url: URL) -> UIImage?

}

final class LoadImagesCacherImplement: LoadImagesCacher {

    private var imageDictionary: [URL: UIImage] = [:]

    static let shared = LoadImagesCacherImplement()

    private init() {}

    func cacheImage(url: URL, image: UIImage) {
        imageDictionary[url] = image
    }

    func getCachedImage(_ url: URL) -> UIImage? {
        return imageDictionary[url]
    }

}
