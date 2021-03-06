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

    init(model: DianthusModelProtocol, output: DianthusPresenterOutputProtocol) {
        self.model = model
        self.output = output
    }

    func fetchWordList(from: String) {
        model.fetchWordList(from: from) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let wordList):
                let items = DianthusTranslator.translate(from: wordList)
                self.output.updateItems(items)

            case .failure(let error):
                self.output.handleError(error)
            }
        }
    }

}
