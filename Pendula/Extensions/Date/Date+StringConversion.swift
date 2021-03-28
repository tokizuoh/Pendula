//
//  Date+StringConversion.swift
//  Pendula
//
//  Created by tokizo on 2021/03/28.
//

import UIKit

extension Date {

    enum DateFormat {
        case yyyyMMddPd
    }

    func string(dateFormat: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)

        switch dateFormat {
        case .yyyyMMddPd:
            formatter.dateFormat = "yyyy.MM.dd"
        }

        return formatter.string(from: self)
    }

}
