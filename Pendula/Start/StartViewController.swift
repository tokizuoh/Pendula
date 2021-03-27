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
    @IBOutlet weak var versionLabel: UILabel!{
        didSet {
            versionLabel.text = getAppVersion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveList(_ sender: Any) {
        // TODO: move list
    }

}

extension StartViewController {
    
    private func getAppVersion() -> String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return version
    }

}
