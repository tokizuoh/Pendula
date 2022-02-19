//
//  CombinePracticeBuilder.swift
//  Pendula
//
//  Created by tokizo on 2022/02/19.
//

import Foundation

struct CombinePracticeBuilder: Builder {

    typealias ViewController = CombinePracticeViewController

    func build() -> ViewController {
        let vc = R.storyboard.combinePractice.combinePractice()!
        return vc
    }

}
