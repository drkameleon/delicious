/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Integers.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Int-related methods
 ********************************************************/

import Foundation

public extension Int {
    
    /**
     Generates random number
     */
    func random() -> Int {
        #if os(Linux)
            return random()
        #else
            return Int(arc4random())
        #endif
    }
    
    /**
     Adds left padding with zeros to number
     */
    func padWithZeros(_ zerosCount: Int) -> String {
        return String(format: "%0\(zerosCount)d", self)
    }
    
    /**
     Calculates the nth factorial
     */
    func factorial() -> Int {
        return (1...self).reduce(1,*)
    }
    
    /**
     Calculates the xth power of the given number
     */
    func power(_ x: Int) -> Decimal {
        return pow(Decimal(self), x)
    }
    
    /**
     Calculates the square of the given number
     */
    func square() -> Decimal {
        return self.power(2)
    }
    
    
    
}
