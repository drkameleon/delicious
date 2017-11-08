/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : HTTP.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | HTTP-related methods
 ********************************************************/

import Foundation

/**
 Makes an HTTP request
 */
func makeHTTPRequest(_ address: String, method: String = "GET", body: String = "",
                     handler: @escaping (String)->Void) {
    let url = URL(string: address)
    var req = URLRequest(url: url!)
    
    req.httpMethod = method
    req.httpBody = body.data(using: .utf8)
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    let task = session.dataTask(with: req) { (data,response,error) in
        if error != nil {
            printLog(error, error: true)
            handler("")
        } else {
            if let data = data,
               let dataStr = String(data: data, encoding: .utf8) {
                
                handler(dataStr)
            }
        }
    }
    
    task.resume()
}
