//
//  Iterator.swift
//  IteratorTest
//
//  Created by Aram on 7/4/21.
//

final class JSONIterator: Iteratable {
    var hasNext: Bool {
        return position + 1 < list.count
    }
    
    var next: Item? {
        if (hasNext) {
            position += 1
            return hasNext ? list[position] : nil
        }
        
        return nil
    }
    
    private var position: Int = 0
    private var list: [Item]
    
    init(_ list: [Item], _ sort: ISort) {
        
        self.list = sort.sort(list)
    }
}
