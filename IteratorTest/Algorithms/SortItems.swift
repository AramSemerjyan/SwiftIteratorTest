//
//  SortItems.swift
//  IteratorTest
//
//  Created by Aram on 7/5/21.
//

import Foundation

final class SortItems: ISort {
    
    private var type: SortType
    
    init(_ type: SortType) {
        self.type = type
    }
    
    func sort(_ list: [Item]) -> [Item] { emMergeSort(data: list, by: type) }
    
    private func merge(left: [Item], right: [Item], by: SortType) -> [Item] {
        var output: [Item] = []
        
        var mutableLeft = left
        var mutableRight = right
        while mutableLeft.count > 0 && mutableRight.count > 0 {
            
            if let firstElement = mutableLeft.first, let secondElement = mutableRight.first {
                
                let condition = by == .ascending ? firstElement.time < secondElement.time : firstElement.time > secondElement.time
                
                if condition {
                    output.append(secondElement)
                    mutableRight.remove(at: 0)
                } else {
                    output.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
            }
        }
        
        output.append(contentsOf: mutableLeft)
        output.append(contentsOf: mutableRight)
        
        return output
    }
    
    private func emMergeSort(data: [Item], by: SortType) -> [Item] {
        if data.count < 2 { return data }
        
        let leftArray = Array(data[..<Int(data.count / 2)])
        let rightArray = Array(data[Int(data.count / 2)..<data.count])
        
        return merge(left: emMergeSort(data: leftArray, by: by), right: emMergeSort(data: rightArray, by: by), by: by)
    }
}
