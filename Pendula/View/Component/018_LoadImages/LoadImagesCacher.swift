//
//  LoadImagesCacher.swift
//  Pendula
//
//  Created by tokizo on 2021/12/05.
//

import Foundation

protocol LoadImagesCacher {
    /// 画像Dataをキャッシュする
    func cacheImageData(url: URL, imageData: Data)

    /// キャッシュ済みの画像Dataを返す（存在しない場合はnilを返す）
    func getCachedImageData(_ url: URL) -> Data?

}

final class LoadImagesCacherImplement: LoadImagesCacher {

    private var imageDataDictionary: [URL: Data] = [:]

    static let shared = LoadImagesCacherImplement()

    private init() {}

    func cacheImageData(url: URL, imageData: Data) {
        imageDataDictionary[url] = imageData
    }

    func getCachedImageData(_ url: URL) -> Data? {
        return imageDataDictionary[url]
    }

}
