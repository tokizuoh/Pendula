//
//  DianthusPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

enum DianthusError: Error {
    case unknown
}

protocol DianthusPresenterProtocol {
    func fetchWordList(from: String)
}

final class DianthusPresenter: DianthusPresenterProtocol {

    var model: DianthusModelProtocol!
    weak var output: DianthusPresenterOutputProtocol!

    func fetchWordList(from: String) {
        switch model.fetchWordList(from: from) {
        case .success(let wordList):
            output.updateWordList(wordList)

        case .failure(let error):
            output.handleError(error)
        }
    }

}
