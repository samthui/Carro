//
//  CalendarExtensionTests.swift
//  Carro
//
//  Created by N T P Ngoc on 02/05/2022.
//

import XCTest
@testable import Carro

class CalendarExtensionTests: XCTestCase {
    private var calendar: Calendar!
    let secondsPerDay = 86400.0

    override func setUpWithError() throws {
        calendar = Calendar.current
    }

    override func tearDownWithError() throws {
        calendar = nil
    }

    func testNumberOfDaysBetweenTimestamp() throws {
        let diff = 7.0
        
        let timestamp1 = 12.0
        let timestamp2 = timestamp1 + diff*secondsPerDay
        
        XCTAssertEqual(calendar.numberOfDaysBetweenTimestamp(timestamp1, and: timestamp2), Int(diff) + 1)
    }
    
    func testNumberOfDaysBetweenDates() throws {
        let diff = 5.0
        
        let date1 = Date()
        let date2 = date1.addingTimeInterval(diff*secondsPerDay)
        
        XCTAssertEqual(calendar.numberOfDaysBetweenDates(date1, and: date2), Int(diff) + 1)
    }
}
