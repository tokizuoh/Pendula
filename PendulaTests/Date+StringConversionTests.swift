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

    func test_Dateが文字列に変換されるか_年月日_月ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2021, month: 3, day: 28))!

        let value = date.string(format: .yyyyMMddPd)
        let expected = "2021.03.28"
        XCTAssertEqual(value, expected)
    }

    func test_Dateが文字列に変換されるか_年月日_日ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 8))!

        let value = date.string(format: .yyyyMMddPd)
        let expected = "2020.12.08"
        XCTAssertEqual(value, expected)
    }

    func test_Dateが文字列に変換されるか_年月日時分秒_時ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 8, hour: 2, minute: 11, second: 10))!

        let value = date.string(format: .yyyyMMddHHmmssPd)
        let expected = "2020.12.08 02:11:10"
        XCTAssertEqual(value, expected)
    }

    func test_Dateが文字列に変換されるか_年月日時分秒_分ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 8, hour: 13, minute: 1, second: 10))!

        let value = date.string(format: .yyyyMMddHHmmssPd)
        let expected = "2020.12.08 13:01:10"
        XCTAssertEqual(value, expected)
    }

    func test_Dateが文字列に変換されるか_年月日時分秒_秒ゼロ埋め() throws {
        let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 8, hour: 13, minute: 11, second: 0))!

        let value = date.string(format: .yyyyMMddHHmmssPd)
        let expected = "2020.12.08 13:11:00"
        XCTAssertEqual(value, expected)
    }

}
