//
//  String+DateConversionTests.swift
//  PendulaTests
//
//  Created by tokizo on 2021/03/31.
//

import XCTest
@testable import Pendula

final class StringPlusDateConversionTests: XCTestCase {

    private let calendar: Calendar = Calendar(identifier: .gregorian)

    func test_StringがDateに変換されるか_月ゼロ埋め() throws {
        let dateString = "2021.03.31"

        let value = dateString.date(format: .yyyyMMddPd)
        let expected = calendar.date(from: DateComponents(year: 2021, month: 03, day: 31))!
        XCTAssertEqual(value, expected)
    }

    func test_StringがDateに変換されるか_日ゼロ埋め() throws {
        let dateString = "2020.12.08"

        let value = dateString.date(format: .yyyyMMddPd)
        let expected = calendar.date(from: DateComponents(year: 2020, month: 12, day: 08))!
        XCTAssertEqual(value, expected)
    }

}
