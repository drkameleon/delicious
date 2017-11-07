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
    
}
