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
        return from.compactMap { word in
            .init(word: word)
        }
    }
}
