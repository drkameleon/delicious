/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Arrays.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Array methods
 ********************************************************/

import Foundation

extension Array where Element: Hashable {
    
    /**
     Removes duplicates from array
     */
    func removeDuplicates() -> [Element] {
        var set = Set<Element>()
        
        let result = self.filter {
            guard !set.contains($0) else {
                return false
            }
            set.insert($0)
            return true
        }
        return result
    }
    
    /**
     Removes element from array by value
     */
    func removeByValue(_ v: Element) -> [Element] {
        return self.filter { $0 != v }
    }
    
    /**
     Shuffles array
     */
    func shuffle() -> [Element] {
        return self.sorted{ _,_ in
            arc4random() < arc4random()
        }
    }
    
    /**
     Return random element from array
     */
    func randomElement() -> Element {
        return self[Int(arc4random()) % self.count]
    }
    
    /**
     Search for value in array and returns array of indexes
     */
    func findValue(_ v: Element) -> [Int] {
        var indexes: [Int] = []
        
        for (index,item) in self.enumerated() {
            if item == v {
                indexes.append(index)
            }
        }
        
        return indexes
    }
}
