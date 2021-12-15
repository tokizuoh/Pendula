//
//  LoadImagesCacher.swift
//  Pendula
//
//  Created by tokizo on 2021/12/05.
//

import Foundation

protocol LoadImagesCacher {
    /// 画像をキャッシュする
    func cacheImage(url: URL, imageData: Data)

    /// キャッシュ済みの画像を返す（存在しない場合はnilを返す）
    func getCachedImageData(_ url: URL) -> Data?

}

final class LoadImagesCacherImplement: LoadImagesCacher {

    private var imageDictionary: [URL: Data] = [:]

    static let shared = LoadImagesCacherImplement()

    private init() {}

    func cacheImage(url: URL, imageData: Data) {
        imageDictionary[url] = imageData
    }

    func getCachedImageData(_ url: URL) -> Data? {
        return imageDictionary[url]
    }

}
