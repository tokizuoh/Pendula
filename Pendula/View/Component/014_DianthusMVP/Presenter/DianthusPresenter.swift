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

struct DianthusPresenter: DianthusPresenterProtocol {

    var model: DianthusModelProtocol!

    func fetchWordList(from: String) {
        switch model.fetchWordList(from: from) {
        case .success(let wordList):
            // TODO [#86]: outputにわたす
            break

        case .failure(let error):
            // TODO [#86]: outputにわたす
            break
        }
    }

}
