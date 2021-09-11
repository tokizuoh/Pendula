//
//  DianthusMVPViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import UIKit

final class DianthusMVPViewController: ComponentBaseViewController {

    @IBOutlet weak var textField: UITextField!

    var presenter: DianthusPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "014 Dianthus by MVP",
                                blogURL: nil,
                                githubPRURL: nil)
    }

    @IBAction func go(_ sender: Any) {
        guard let text = textField.text else {
            return
        }

        presenter.fetchWordList(from: text)
    }

}

extension DianthusMVPViewController: DianthusPresenterOutputProtocol {

    func updateWordList(_ wordList: [Word]) {
        for i in wordList {
            print(i.raw, i.roman, i.vowels)
        }
    }

    func handleError(_ error: DianthusError) {
        // TODO [#86] エラーハンドリング: エラーをユーザーに伝える or 何もしない
    }

}
