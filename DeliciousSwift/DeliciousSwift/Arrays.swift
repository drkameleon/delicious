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

public extension Array where Element: Hashable {
    
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
     Returns random element from array
     */
    func randomElement() -> Element {
        return self[Int(arc4random()) % self.count]
    }
    
    /**
    Returns element at given index
    */
    func elementAt(_ index: Int) -> Element {
        return self[index]
    }
    
    /**
    Returns array of elements at given indexes
    */
    func elementsAt(_ indexes: [Int]) -> [Element] {
        var result : [Element] = []
        
        for index in indexes {
            result += [self[index]]
        }
        
        return result
    }
    
    /**
    Checks if array contains an array of given elements
    */
    func containsAll(_ elements: [Element]) -> Bool {
        for element in elements {
            if !self.contains(element) {
                return false
            }
        }
        
        return true
    }
    
    /**
     Searches for value in array and returns array of indexes
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
    
    /**
     Convers array to Json string
     */
    func toJson(pretty: Bool = false, encoding: String.Encoding = .utf8) -> String? {
        do {
            let options : JSONSerialization.WritingOptions = pretty ? [.prettyPrinted] : []
            let json = try JSONSerialization.data(withJSONObject: self, options: options)

            return String(data: json, encoding: encoding)
        }
        catch let error {
            printLog(error, error: true)
            return nil
        }
    }
    
}

public extension Array where Element == Int {
    
    /**
     Calculates the average of an array of numbers
     */
    func average() -> Double {
        return Double(self.reduce(0,+)) / Double(self.count)
    }
    
    /**
     Calculates the median of an array of numbers
     */
    func median() -> Double {
        let sorted = self.sorted()
        
        return sorted.count % 2 == 1 ? Double(sorted[sorted.count/2])
                                     : Double(sorted[sorted.count/2-1] + sorted[sorted.count/2]) / 2.0
    }

    /**
     Calculates the product of an array of numbers
     */
    func product() -> Int {
        return self.reduce(1,*)
    }
    
    /**
     Calculates the sum of an array of numbers
     */
    func sum() -> Int {
        return self.reduce(0,+)
    }
    
}
