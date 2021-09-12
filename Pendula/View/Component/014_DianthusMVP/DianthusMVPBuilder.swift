//
//  DianthusMVPBuilder.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

struct DianthusMVPBuilder: Builder {

    typealias ViewController = DianthusMVPViewController

    func build() -> ViewController {
        let vc = R.storyboard.dianthusMVP.dianthusMVP()!

        let model = DianthusModel()
        let presenter = DianthusPresenter(model: model, output: vc)

        vc.presenter = presenter

        return vc
    }

}
