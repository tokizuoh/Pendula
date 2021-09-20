//
//  FlowLayoutBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/09/20.
//

import Foundation

struct FlowLayoutBuilder: Builder {

    typealias ViewController = FlowLayoutViewController

    func build() -> ViewController {
        let vc = R.storyboard.flowLayout.flowLayout()!
        return vc
    }

}
