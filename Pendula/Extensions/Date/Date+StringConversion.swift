//
//  Date+StringConversion.swift
//  Pendula
//
//  Created by tokizo on 2021/03/28.
//

import UIKit

extension Date {

    enum StringFormat {
        case yyyyMMddPd
    }

    func string(format: StringFormat) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)

        switch format {
        case .yyyyMMddPd:
            formatter.dateFormat = "yyyy.MM.dd"
        }

        return formatter.string(from: self)
    }

}
