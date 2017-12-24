/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Colors.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Color manipulation methods
 ********************************************************/

import Foundation

public extension NSColor {

    convenience init (red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Creates an Color instance from an (Int) hex value
     */
    convenience init (hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
    /**
     Creates an Color instance from a (String) hex value
     */
    convenience init? (hex: String) {
        if let hexInt = Int(hex.replace("#", with: ""), radix: 16) {
            self.init(hex: hexInt)
        } else {
            return nil
        }
    }
    
    func hexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return (NSString(format:"#%06x", rgb) as String).uppercased()
    }
    
}
