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
     Adds left padding with zeros to number
     */
    func padWithZeros(_ zerosCount: Int) -> String {
        return String(format: "%0\(zerosCount)d", self)
    }
    
}
