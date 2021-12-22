//
//  LarksBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/12/22.
//

import Foundation

struct LarksBuilder: Builder {

    typealias ViewController = LarksViewController

    func build() -> ViewController {
        let vc = R.storyboard.larks.larks()!
        return vc
    }

}
