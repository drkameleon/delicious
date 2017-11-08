/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Floats.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Float-related methods
 ********************************************************/

import Foundation

public extension Float {
    
    /**
     Formats number with given number of decimal places
     */
    func formatDecimal(_ decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }
    
}
