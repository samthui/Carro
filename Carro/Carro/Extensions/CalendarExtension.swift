//
//  CalendarExtension.swift
//  Carro
//
//  Created by N T P Ngoc on 01/05/2022.
//

import Foundation

extension Calendar {
    func numberOfDaysBetweenTimestamp(_ from: Double, and to: Double) -> Int {
        let fromDate = Date(timeIntervalSince1970: from)
        let toDate = Date(timeIntervalSince1970: to)
        let numberOfDays = Calendar.current.numberOfDaysBetweenDates(fromDate, and: toDate)
        
        return numberOfDays
    }
    
    func numberOfDaysBetweenDates(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1
    }
}
