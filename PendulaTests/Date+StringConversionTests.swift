//
//  Date+StringConversionTests.swift
//  PendulaTests
//
//  Created by tokizo on 2021/03/26.
//

import XCTest
@testable import Pendula

final class DatePlusStringConversionTests: XCTestCase {

    private let calendar: Calendar = Calendar(identifier: .gregorian)

    func testDateが文字列に変換されるか_月ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2021, month: 3, day: 28))!

        let value = date.string(dateFormat: .yyyyMMddPd)
        let expected = "2021.03.28"
        XCTAssertEqual(value, expected)
    }

    func testDateが文字列に変換されるか_日ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 8))!

        let value = date.string(dateFormat: .yyyyMMddPd)
        let expected = "2020.12.08"
        XCTAssertEqual(value, expected)
    }

}
