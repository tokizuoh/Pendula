//
//  AccessibilityBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/11/13.
//

import Foundation

struct AccessibilityBuilder: Builder {
    typealias ViewController = AccessibilityViewController

    func build() -> ViewController {
        let vc = R.storyboard.accessibility.accessibility()!
        return vc
    }
}
