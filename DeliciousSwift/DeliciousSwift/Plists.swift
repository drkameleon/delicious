/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Plists.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Property Lists manipulation methods
 ********************************************************/

import Foundation

public extension String {
    
    /**
     Creates dictionary from Property List (XML) string
     */
    func plistToDictionary(encoding: String.Encoding = .utf8) -> [String : Any]? {
        let data = self.data(using: encoding)
        var format = PropertyListSerialization.PropertyListFormat.xml
        
        let dict = try? PropertyListSerialization.propertyList(from: data!, options: [], format: &format) as! [String : Any]
        
        return dict
    }
}
