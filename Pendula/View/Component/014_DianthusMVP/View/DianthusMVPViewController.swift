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

        // TODO [#86]: Builderかなにかを作ってそこでDIする
        presenter = DianthusPresenter()
        presenter?.fetchWordList(from: "hoge")
    }

}
