//
//  CombinePracticeViewController.swift
//  Pendula
//
//  Created by tokizo on 2022/02/19.
//

import UIKit

final class CombinePracticeViewController: ComponentBaseViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(navigationTitle: "019 CombinePractice")
    }

}

extension CombinePracticeViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(1)
        return true
    }
}
