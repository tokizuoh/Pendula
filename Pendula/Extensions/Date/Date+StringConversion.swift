//
//  Date+StringConversion.swift
//  Pendula
//
//  Created by tokizo on 2021/03/28.
//

import UIKit

extension Date {

    func string() -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)

    }

}
