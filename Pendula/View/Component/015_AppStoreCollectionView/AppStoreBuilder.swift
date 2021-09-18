//
//  AppStoreBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/09/18.
//

import Foundation

struct AppStoreBuilder: Builder {

    typealias ViewController = AppStoreViewController

    func build() -> ViewController {
        let vc = R.storyboard.appStore.appStore()!
        return vc
    }

}
