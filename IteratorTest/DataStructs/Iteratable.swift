//
//  Iteratable.swift
//  IteratorTest
//
//  Created by Aram on 7/4/21.
//

protocol Iteratable {
    associatedtype T
    
    var hasNext: Bool { get }
    var next: T? { get }
}
