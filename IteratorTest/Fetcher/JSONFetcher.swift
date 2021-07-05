//
//  JSONFetcher.swift
//  IteratorTest
//
//  Created by Aram on 7/5/21.
//
import Foundation

class JSONFetcher: IDataFetcher {
    func fetch() -> [Item]? {
        if let data = getData(filePath) {
            let parsed = parseData(data)
            
            return parsed
        }
        
        return nil
    }
    
    private var filePath: String!
    
    init(_ filePath: String) {
        self.filePath = filePath
    }
    
    
    
    private func getData(_ path: String) -> Data? {
        do {
            let contents = try Data(contentsOf: URL(fileURLWithPath: path))
            
            return contents
        }
        catch let error {
            print("Ooops! Something went wrong: \(error)")
            
            return nil
        }
    }
    
    private func parseData(_ data: Data) -> [Item]? {
        do {
            let parsed = try JSONDecoder().decode([ItemInstance].self, from: data)
            
            return parsed
        } catch let error {
            print("Ooops! Something went wrong while parsing data: \(error)")
            
            return nil
        }
    }
}
