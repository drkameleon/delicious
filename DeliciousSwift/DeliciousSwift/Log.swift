/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Log.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Message/Error logging methods
 ********************************************************/

import Foundation

/**
 Prints message to log
 */
public func printLog(_ obj: Any? = nil, error: Bool = false, _ file : String = #file, _ line : Int = #line, _ function : String = #function) {
    
    let filename = URL(fileURLWithPath:file).lastPathComponent
    var output : String
    
    if obj != nil {
        let msg = String(describing: obj!)
        output = "\(error ? "‼️" : "✅") \(filename)/\(line) : \(function) ▫️ \(msg)"
    } else {
        output = "\(error ? "‼️" : "✅") \(filename)/\(line) : \(function)"
    }
    
    print(output)
    
    /*
    // To print in the usual Console
     
    if error {
        NSLog(output)
    }
    */
    
}
