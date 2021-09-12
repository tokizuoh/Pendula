//
//  Translator.swift
//  Pendula
//
//  Created by tokizo on 2021/09/12.
//

import Foundation

protocol Translator {
    associatedtype From
    associatedtype To

    static func translate(from: From) -> To
}
