//
//  DateList+RemoveDuplicationTests.swift
//  PendulaTests
//
//  Created by tokizo on 2021/05/31.
//

import XCTest
@testable import Pendula

final class DateListPlusRemoveDuplicationTests: XCTestCase {

    func test_重複あり_重複削除されるか() throws {
        let date = Date()
        let dates: [Date] = [
            date,
            date,
            Calendar.current.date(byAdding: .day, value: -1, to: date)!,
            Calendar.current.date(byAdding: .day, value: +1, to: date)!
        ]

        let removedDuplicationDates = dates.removeDuplication()

        let value = removedDuplicationDates.count
        let expected = 3
        XCTAssertEqual(value, expected)
    }

    func test_重複なし_重複削除されないか() throws {
        let date = Date()
        let dates: [Date] = [
            date,
            Calendar.current.date(byAdding: .day, value: -1, to: date)!,
            Calendar.current.date(byAdding: .day, value: +1, to: date)!
        ]

        let removedDuplicationDates = dates.removeDuplication()

        let value = removedDuplicationDates.count
        let expected = 3
        XCTAssertEqual(value, expected)
    }

    func test_すべて重複_重複削除されるか() throws {
        let date = Date()
        let dates: [Date] = [
            date,
            date,
            date
        ]

        let removedDuplicationDates = dates.removeDuplication()

        let value = removedDuplicationDates.count
        let expected = 1
        XCTAssertEqual(value, expected)
    }

    func test_空_空で返るか() throws {
        let dates: [Date] = []

        let removedDuplicationDates = dates.removeDuplication()

        let value = removedDuplicationDates.count
        let expected = 0
        XCTAssertEqual(value, expected)
    }

}
