//
//  DianthusPresenterOutput.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol DianthusPresenterOutputProtocol: AnyObject {
    func updateItems(_ items: [DianthusMVPViewController.Item])
    func handleError(_ error: DianthusError)
}
