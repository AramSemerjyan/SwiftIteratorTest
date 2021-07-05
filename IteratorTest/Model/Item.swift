//
//  Item.swift
//  IteratorTest
//
//  Created by Aram on 7/5/21.
//

protocol Item: Decodable {
    var id: Int { get }
    var time: Int { get }
    var name: String { get }
}
