//
//  IrregularLayoutCellItemColumn.swift
//  Pendula
//
//  Created by tokizo on 2021/04/01.
//

import UIKit

struct IrregularLayoutCellItemColumn {

    var items: [IrregularLayoutCellItem]!

    init(items: [IrregularLayoutCellItem]) {
        self.items = items
    }

    var totalHeight: CGFloat {
        var total: CGFloat = 0
        items.forEach { item in
            total += item.height
        }
        return total
    }
}
