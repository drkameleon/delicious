/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Dates.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Date manipulation methods
 ********************************************************/

import Foundation

public extension Date {
    
    /**
     Check if date is in the past
     */
    func isPast() -> Bool {
        return self < Date()
    }
    
    /**
     Checks if date is in the future
     */
    func isFuture() -> Bool {
        return self > Date()
    }
    
    /**
     Checks if date is today
     */
    func isToday() -> Bool {
        let dateToCheck = Calendar.current.dateComponents([.year,.month,.day], from: self)
        let currentDate = Calendar.current.dateComponents([.year,.month,.day], from: Date())
        
        return dateToCheck.year == currentDate.year &&
               dateToCheck.month == currentDate.month &&
               dateToCheck.day == currentDate.day
    }
    
    /**
     Returns day from date
     */
    func day() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /**
     Returns month from date
     */
    func month() -> Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /**
     Returns month from date
     */
    func monthName() -> String {
        let months = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"]
        
        return months[self.month()-1]
    }
    
    /**
     Returns year from date
     */
    func year() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /**
     Returns difference with given date in seconds
     */
    func secondsUntil(date: Date) -> Int {
        let start = Calendar.current.ordinality(of: .second, in: .year, for: self)
        let end = Calendar.current.ordinality(of: .second, in: .year, for: date)
        
        return end! - start!
    }
    
    /**
     Returns difference with given date in days
     */
    func daysUntil(date: Date) -> Int {
        let start = Calendar.current.ordinality(of: .day, in: .era, for: self)
        let end = Calendar.current.ordinality(of: .day, in: .era, for: date)
        
        return end! - start!
    }
    
}
