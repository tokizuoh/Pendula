//
//  PlistManager.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

struct PlistManager {

    let filePath: String

    init?(fileName: String) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            return nil
        }

        self.filePath = filePath
    }

    private func getKeys() -> NSDictionary? {
        return NSDictionary(contentsOfFile: filePath)
    }

    func getValue(key: String) -> AnyObject? {
        guard let dict = getKeys() else {
            return nil
        }

        return dict[key] as AnyObject
    }

}
