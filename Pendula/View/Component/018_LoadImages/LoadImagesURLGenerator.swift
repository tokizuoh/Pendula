//
//  LoadImagesURLGenerator.swift
//  Pendula
//
//  Created by tokizo on 2021/12/18.
//

import Foundation

protocol LoadImagesURLGenerator {
    func generate(count: Int) -> [URL]
}

final class LoadImagesURLGeneratorImplement: LoadImagesURLGenerator {

    // TODO: [#127] テキスト色も動的に変更できるようにする
    private let baseURLString = "https://placehold.jp/%@/ffffff/1000x2000.png?text=1000%%20%%C3%%97%%202000"

    func generate(count: Int) -> [URL] {
        return (0..<count).map { _ in
            let backgroundColorCode = getRandomColorCode()
            let URLString = String(format: baseURLString, backgroundColorCode)
            return .init(string: URLString)!
        }
    }

    // TODO: [#127] ランダムな値にする
    private func getRandomColorCode() -> String {
        return "000000"
    }

}
