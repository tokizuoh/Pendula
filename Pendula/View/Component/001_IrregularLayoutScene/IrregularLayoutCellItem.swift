//
//  IrregularLayoutCellItem.swift
//  Pendula
//
//  Created by tokizo on 2021/03/31.
//

import UIKit

struct IrregularLayoutCellItem: Hashable {

    static func == (lhs: IrregularLayoutCellItem, rhs: IrregularLayoutCellItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID().uuidString
    var height = CGFloat.random(in: 0.5...2.0)

}

extension IrregularLayoutCellItem {

    static func generateItems(count: Int) -> [IrregularLayoutCellItem] {
        var items = [IrregularLayoutCellItem]()

        for _ in 0..<35 {
            items.append(IrregularLayoutCellItem())
        }

        return items
    }

}
