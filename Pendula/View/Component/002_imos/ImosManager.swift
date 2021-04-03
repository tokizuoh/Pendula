//
//  ImosManager.swift
//  Pendula
//
//  Created by tokizo on 2021/04/03.
//

import Foundation

final class ImosManager {
    private let cellCount: Int
    private var counts: [Int]!
    var calculatedCounts: [Int]!
    var indexPath: IndexPath?

    enum State {
        case processing
        case doneCalculate
    }
    private(set) var state: State = .processing

    init(cellCount: Int) {
        self.cellCount = cellCount
        refresh()
    }

    func refresh() {
        counts = [Int](repeating: 0, count: cellCount + 1)
        calculatedCounts = [Int](repeating: 0, count: cellCount + 1)
        state = .processing
    }

    func update(li: Int, ri: Int) {
        counts[li] += 1
        counts[ri + 1] -= 1
    }

    func calculate() {
        for i in 1..<(cellCount + 1) {
            calculatedCounts[i] += calculatedCounts[i - 1] + counts[i - 1]
        }
        state = .doneCalculate
    }

}
