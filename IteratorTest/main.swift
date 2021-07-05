//
//  main.swift
//  IteratorTest
//
//  Created by Aram on 7/4/21.
//

import Foundation

let fetcher: IDataFetcher = JSONFetcher("$PATH/IteratorTest/IteratorTest/Files/generated.json")

if let items = fetcher.fetch() {
    let iterator = JSONIterator(items, SortItems(.descending))
    
    while iterator.hasNext {
        let next = iterator.next
        print("time: \(next?.time ?? -1)")
        print("name: \(next?.name ?? "no Name")")
        print("=========")
    }
}

