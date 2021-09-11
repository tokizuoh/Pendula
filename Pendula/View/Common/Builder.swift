//
//  Builder.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol Builder {

    associatedtype ViewController

    func build() -> ViewController

}
