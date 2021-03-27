//
//  StartViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/03/27.
//

import UIKit

final class StartViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Pendula"
        }
    }
    @IBOutlet weak var versionLabel: UILabel! {
        didSet {
            versionLabel.text = "version: \(getAppVersion())"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveVerificationList(_ sender: Any) {
        let storyboard = UIStoryboard(name: "VerificationList", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "verificationList") as! VerificationListViewController
        present(vc, animated: true)
    }

}

extension StartViewController {

    private func getAppVersion() -> String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return version
    }

}
