//
//  DateList+RemoveDuplication.swift
//  Pendula
//
//  Created by tokizo on 2021/05/31.
//

import UIKit

extension Array where Element == Date {

    /// Remove duplicate dates./
    func removeDuplication() -> [Date] {
        var result: [Date] = []
        var dateStringSet = Set<String>()
        for date in self {
            let dateString = date.string(format: .yyyyMMddPd)
            if dateStringSet.contains(dateString) {
                continue
            }
            result.append(date)
            dateStringSet.insert(dateString)
        }
        return result
    }

}
