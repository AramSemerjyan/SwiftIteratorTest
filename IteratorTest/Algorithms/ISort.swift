//
//  SortItems.swift
//  IteratorTest
//
//  Created by Aram on 7/5/21.
//

import Foundation

enum SortType {
    case ascending
    case descending
}

protocol ISort {
    func sort(_ list: [Item]) -> [Item]
}
