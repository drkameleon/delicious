/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Files.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | File management methods
 ********************************************************/

import Foundation

public extension String {
    
    /**
     Checks if file in path exists
     */
    func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath: self)
    }
    
    /**
     Check if path is folder
    */
    func isFolder() -> Bool {
        var check : ObjCBool = false
        let _ = FileManager.default.fileExists(atPath: self, isDirectory: &check)
        
        return check.boolValue
    }
    
    /**
     Copies file at path to given path
     */
    func copyFileTo(_ path: String) -> Void {
        do {
            try FileManager.default.copyItem(atPath: self, toPath: path)
        }
        catch let error {
            printLog(error, error: true)
        }
    }
    
    /**
     Moves file at path to given path
     */
    func moveFileTo(_ path: String) -> Void {
        do {
            try FileManager.default.moveItem(atPath: self, toPath: path)
        }
        catch let error {
            printLog(error, error: true)
        }
    }
    
    /**
     Renames file at path as new path
     */
    func renameFileAs(_ path: String) -> Void {
        self.moveFileTo(path)
    }
    
    /**
     Deletes file at path
     */
    func deleteFile() -> Void {
        do {
            try FileManager.default.removeItem(atPath: self)
        }
        catch let error {
            printLog(error, error: true)
        }
    }
    
    /**
     Creates folder from path
     */
    func createAsFolder() -> Void {
        do {
            try FileManager.default.createDirectory(atPath: self, withIntermediateDirectories: true, attributes: [:])
        }
        catch let error {
            printLog(error, error: true)
        }
    }
    
    /**
     Extracts extension from path
     */
    func pathExtension() -> String {
        let url = URL(fileURLWithPath: self)
        
        return url.pathExtension
    }
    
    /**
     Extracts filename from path
     */
    func pathFilename() -> String {
        let url = URL(fileURLWithPath: self)
        
        return url.lastPathComponent
    }
    
    /**
     Extracts folder from path
     */
    func pathFolder() -> String {
        let url = URL(fileURLWithPath: self)
        
        return url.deletingLastPathComponent().path
    }
    
    /**
     Gets folder contents from path
     */
    func pathContents() -> [String]? {
        do {
            let contents = try FileManager.default.subpathsOfDirectory(atPath: self)
            return contents
        }
        catch {
            return nil
        }
    }

}

/**
 Gets temporary folder path
 */

public func temporaryFolder() -> String {
    let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
    
    return tempDirectoryURL.path
}

/**
 Gets temporary folder path
 */

public func temporaryFile(_ ext: String = "txt") -> String {
    let path = temporaryFolder()
    let uniqueFilename = ProcessInfo.processInfo.globallyUniqueString + "." + ext
    
    return path + "/" + uniqueFilename
}
