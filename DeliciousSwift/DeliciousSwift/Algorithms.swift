/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Algorithms.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Known algorithm implementations in Swift
 ********************************************************/

import Foundation

/**
 Linear search algorithm
 */
func linearSearch<T: Comparable>(_ search: T, in items: [T]) -> Int? {
    for (index, item) in items.enumerated() {
        if item == search {
            return index
        }
    }
    
    return nil
}

/**
 Binary search algorithm
 */
func binarySearch<T: Comparable>(_ search: T, in items: [T], from: Int, to: Int) -> Int? {
    guard from <= to else { return nil }
    
    let mid = (from + to)/2
    let val = items[mid]
    
    if val > search {
        return binarySearch(search, in: items, from: from, to: mid-1)
    }
    if val < search {
        return binarySearch(search, in: items, from: mid+1, to: to)
    }
    
    return mid
}

func binarySearch<T: Comparable>(_ search: T, in items: [T]) -> Int? {
    return binarySearch(search, in: items, from: 0, to: items.count-1)
}

/**
 Bubble sort algorithm
 */
func bubbleSort<T: Comparable>(_ items: [T]) -> [T] {
    var result = items
    
    for i in stride(from: result.count-1, to: 1, by: -1) {
        for j in stride(from:0, to: i, by: 1) {
            if result[j] > result[j+1] {
                result.swapAt(j, j+1)
            }
        }
    }
    
    return result
}

/**
 Insertion sort algorithm
*/
func insertionSort<T: Comparable>(_ items:[T]) -> [T] {
    var result = items
    
    for x in 1..<result.count {
        var y = x
        
        while y > 0 && result[y] < result[y-1] {
            result.swapAt(y-1, y)
            y -= 1
        }
    }
    
    return result
}

/**
 QuickSort sort algorithm
 */
func quickSort<T: Comparable>(_ items:[T]) -> [T] {
    guard items.count > 1 else { return items }
    
    let pivot = items[items.count/2]
    
    return quickSort(items.filter { $0 < pivot}) +
           (items.filter { $0 == pivot }) +
           quickSort(items.filter { $0 > pivot })
}
