/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Tasks.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Task-related methods
 ********************************************************/

import Foundation

/**
 Delays block execution for given number of seconds
 */
public func delay(_ seconds: Int, _ function: @escaping () -> Void) {
    sleep(UInt32(seconds))
    function()
}

#if os(OSX)

/**
 Executes terminal command asynchronously
*/
public func executeTerminal(_ command: String, args: [String] = [], env: [String:String] = [:], handler: @escaping (String, String)->Void) {
    
    printLog()
    
    let process = Process()
    
    let outputPipe = Pipe()
    let errorPipe = Pipe()
    
    var processCommand = command
    var processArgs = args
    
    if !command.hasPrefix("/") {
        processArgs.insert(command, at: 0)
        processCommand = "/usr/bin/env"
    }
    
    process.launchPath = processCommand
    
    if args.count > 0 {
        process.arguments = processArgs
    }
    
    var environment = ProcessInfo.processInfo.environment
    
    for (k,v) in env {
        environment[k] = v
    }
    process.environment = environment
    
    process.standardOutput = outputPipe
    process.standardError = errorPipe
    
    // asynchronous execution
    
    DispatchQueue.global().async {
        
        process.launch()
        process.waitUntilExit()
        
        let outResult = String(data: outputPipe.fileHandleForReading.readDataToEndOfFile(),
                               encoding: .utf8)
        
        let errResult = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(),
                               encoding: .utf8)
        
        handler(outResult!, errResult!)
    }
}
  
/**
 Executes terminal command synchronously and return result
 */
public func executeTerminalSync(_ command: String, args: [String] = [], env: [String:String] = [:]) -> (String,String) {
    
    printLog()
    
    let process = Process()
    
    let outputPipe = Pipe()
    let errorPipe = Pipe()
    
    var processCommand = command
    var processArgs = args
    
    if !command.hasPrefix("/") {
        processArgs.insert(command, at: 0)
        processCommand = "/usr/bin/env"
    }
    
    process.launchPath = processCommand
    
    if args.count > 0 {
        process.arguments = processArgs
    }

    var environment = ProcessInfo.processInfo.environment
    
    for (k,v) in env {
        environment[k] = v
    }
    process.environment = environment
    
    process.standardOutput = outputPipe
    process.standardError = errorPipe
    
    // synchronous execution
    
    process.launch()
    process.waitUntilExit()
    
    let outResult = String(data: outputPipe.fileHandleForReading.readDataToEndOfFile(),
                           encoding: .utf8)
    
    let errResult = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(),
                           encoding: .utf8)
    
    return (outResult!, errResult!)

}

#endif
