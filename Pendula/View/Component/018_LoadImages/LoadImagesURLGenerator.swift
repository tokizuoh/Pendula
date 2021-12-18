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
    private var lowercases: [String]!

    func generate(count: Int) -> [URL] {
        setupLowercases()
        return (0..<count).map { _ in
            let backgroundColorCode = getRandomColorCode()
            let URLString = String(format: baseURLString, backgroundColorCode)
            print("URL(string: \"\(URLString)\")!,")
            return .init(string: URLString)!
        }
    }

    private func setupLowercases() {
        let startIndex = 97
        let alphabetCount = 6
        lowercases = (startIndex..<startIndex + alphabetCount).map { String(Character(UnicodeScalar($0)!)) }
    }

    // TODO: [#127] ランダムな値にする
    private func getRandomColorCode() -> String {
        let randomColorCode: String = (0..<6).map { _ in
            let randomIndex = Int.random(in: 0..<lowercases.count)
            let lowercase = lowercases[randomIndex]
            return lowercase
        }.joined()

        return randomColorCode
    }

}
