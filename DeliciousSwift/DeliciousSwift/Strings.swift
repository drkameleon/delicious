/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Strings.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | String handling methods
 ********************************************************/

import Foundation

public extension String {
    
    /**
     Gets/sets string characters at given index
     */
    subscript (index: Int) -> String {
        get {
            let ind = self.index(self.startIndex, offsetBy: index)
            return String(self[ind])
        }
        set {
            let ind = self.index(self.startIndex, offsetBy: index)
            self.replaceSubrange(ind...ind, with: newValue)
        }
    }
    
    /**
     Removes all occurences of given string within string
     */
    static func - (left: String, right: String) -> String {
        return left.replace(right, with: "")
    }
    
    /**
     Repeats string a given number of times
     */
    static func * (left: String, right: Int) -> String {
        return String(repeating: left, count: right)
    }
    
    /**
     Splits string by given separator
     */
    static func / (left: String, right: String) -> [String] {
        return left.split(right)
    }
    
    /**
     Generate unique identifier string
     */
    static func unique() -> String {
        return UUID().uuidString
    }
    
    /**
     Writes string to given path
     */
    func writeToFile(_ path: String, encoding: String.Encoding = .utf8) -> Void {
        let url = URL(fileURLWithPath: path)
        
        do {
            try self.write(to: url, atomically: true, encoding: encoding)
        }
        catch let error {
            printLog(error, error: true)
        }
    }
    
    /**
     Checks if string begins with given string
     */
    func beginsWith(_ s: String) -> Bool {
        return self.hasPrefix(s)
    }
    
    /**
     Checks if string ends with given string
     */
    func endsWith(_ s: String) -> Bool {
        return self.hasSuffix(s)
    }
    
    /**
     Replaces substring in string with given string
     */
    func replace(_ what: String, with: String) -> String {
        return self.replacingOccurrences(of: what, with: with)
    }
    
    /**
     Replaces regular expression in string with given string
     */
    func replaceRegex(_ what: String, with: String) -> String {
        return self.replacingOccurrences(of: what, with: with, options: .regularExpression)
    }
    
    /**
     Checks if string contains regular expression
     */
    func containsRegex(_ r: String) -> Bool {
        return self.range(of: r, options: .regularExpression) != nil
    }
    
    /**
     Trims characters in string
     */
    func trim(_ chars: String) -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: chars))
    }
    
    /**
     Trims all whitespace in string
     */
    func trimWhitespace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /**
     Splits string using given separator string
     */
    func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    /**
     Splits words in string
     */
    func splitWords() -> [String] {
        let options = NSLinguisticTagger.Options.omitWhitespace
        let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.lexicalClass], options: Int(options.rawValue))
        
        var words : [String] = []
        
        tagger.enumerateTags(in: NSMakeRange(0, (self as NSString).length), scheme: NSLinguisticTagScheme.lexicalClass, options: options) { (tag, tokenRange, _, _) in
            let token = (self as NSString).substring(with: tokenRange)
            
            words.append(token)
        }
        
        return words
    }
    
    /**
     Adds space padding to left of string until fixed size is reached
     */
    func padLeft(_ size: Int) -> String {
        return String(repeating: " ", count: size - self.count) + self
    }
    
    /**
     Adds space padding to right of string until fixed size is reached
     */
    func padRight(_ size: Int) -> String {
        return self.padding(toLength: size, withPad: " ", startingAt: 0)
    }
    
}
