//
//  DianthusTranslator.swift
//  Pendula
//
//  Created by tokizo on 2021/09/12.
//

import Foundation

struct DianthusTranslator: Translator {
    typealias From = [Word]
    typealias To = [DianthusMVPViewController.Item]

    static func translate(from: From) -> To {
        var set = Set<Word>()
        return from.reduce(into: []) { (tmp, word) in
            guard !set.contains(word) else {
                return
            }
            set.insert(word)
            tmp.append(.init(word: word))
        }
    }
}
