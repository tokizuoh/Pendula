//
//  ChrysanthemumBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/12/01.
//

import Foundation

struct ChrysanthemumBuilder: Builder {

    typealias ViewController = ChrysanthemumViewController

    func build() -> ChrysanthemumViewController {
        let vc = R.storyboard.chrysanthemum.chrysanthemum()!
        return vc
    }

}
