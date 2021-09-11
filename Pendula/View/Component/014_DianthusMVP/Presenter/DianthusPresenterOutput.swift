//
//  DianthusPresenterOutput.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol DianthusPresenterOutputProtocol: AnyObject {
    func updateWordList(_ wordList: [String])
    func handleError(_ error: DianthusError)
}