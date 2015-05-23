//
//  Date.swift
//  Taskit
//
//  Created by David Vences Vaquero on 23/5/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import Foundation

class Date {
    
    class func from (#year:Int, month:Int, day:Int) -> NSDate {
    
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var date = gregorianCalendar?.dateFromComponents(components)
        
    return date!
        
    }
}