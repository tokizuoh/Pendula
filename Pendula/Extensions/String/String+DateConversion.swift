//
//  String+DateConversion.swift
//  Pendula
//
//  Created by tokizo on 2021/03/31.
//

import UIKit

extension String {

    enum Format {
        case yyyyMMddPd
    }

    func date(format: Format) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)

        switch format {
        case .yyyyMMddPd:
            formatter.dateFormat = "yyyy.MM.dd"
        }

        return formatter.date(from: self)!
    }

}
