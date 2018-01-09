/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Bundle.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Bundle methods
 ********************************************************/

import Foundation

public extension Bundle {
    
    /**
     Returns bundle for given resource path
     */
    func resourcePath(_ subpath:String) -> String? {
        let url = URL(fileURLWithPath: subpath)
        
        let directory = subpath - ("/" + url.lastPathComponent)
        let ext = url.pathExtension
        let filename = url.lastPathComponent - ("." + url.pathExtension)
        
        
        return self.path(forResource: filename, ofType: ext, inDirectory: directory)
    }
    
}

