//
//  HalfModalBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/09/25.
//

import Foundation

struct HalfModalBuilder: Builder {

    typealias ViewController = HalfModalBaseViewController

    func build() -> ViewController {
        let vc = R.storyboard.halfModalBase.halfModalBase()!
        return vc
    }

}
