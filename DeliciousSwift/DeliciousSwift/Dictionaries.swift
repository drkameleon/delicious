/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Dictionaries.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Dictionary methods
 ********************************************************/

import Foundation

public extension Dictionary {
    
    /**
     Merges given dictionary into dictionary and returns result
     */
    func mergeWith(_ dictionary: Dictionary) -> Dictionary {
        var result = self
        
        for (key,value) in dictionary {
            result[key] = value
        }
        
        return result
    }
    
    /**
     Convers dictionary to array of tuples
     */
    func toTupleArray() -> [(Any,Any)] {
        return self.map { ($0,$1) }
    }
    
    /**
     Convers dictionary to Json string
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
