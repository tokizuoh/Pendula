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
        case yyyyMMddHHmmssPd
    }

    func string(format: StringFormat) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)

        switch format {
        case .yyyyMMddPd:
            formatter.dateFormat = "yyyy.MM.dd"
        case .yyyyMMddHHmmssPd:
            formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        }

        return formatter.string(from: self)
    }

}
