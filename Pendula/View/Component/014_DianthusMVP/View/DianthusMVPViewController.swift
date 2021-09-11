//
//  DianthusMVPViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import UIKit

final class DianthusMVPViewController: ComponentBaseViewController {

    var presenter: DianthusPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "014 Dianthus by MVP",
                                blogURL: nil,
                                githubPRURL: nil)

        presenter?.fetchWordList(from: "hoge")
    }

}

extension DianthusMVPViewController: DianthusPresenterOutputProtocol {

    func updateWordList(_ wordList: [String]) {
        // TODO [#86] 画面更新
    }

    func handleError(_ error: DianthusError) {
        // TODO [#86] エラーハンドリング: エラーをユーザーに伝える or 何もしない
    }

}
