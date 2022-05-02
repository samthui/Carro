//
//  UtilsTests.swift
//  CarroTests
//
//  Created by N T P Ngoc on 02/05/2022.
//

import XCTest
@testable import Carro

class UtilsTests: XCTestCase {
    let mainAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.orange, .font: UIFont.systemFont(ofSize: 30)]
    let unitAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.orange, .font: UIFont.systemFont(ofSize: 17)]

    func testAttributeMeasurementKm() throws {
        let length = "177"
        let unit = "km"
        let lengthString = NSMutableAttributedString(string: length, attributes: mainAttribute)
        let unitString = NSAttributedString(string: unit, attributes: unitAttribute)
        lengthString.append(unitString)
        
        let utilsResult = Utils.attributeMeasurement("\(length)\(unit)", unit: unit)!
        XCTAssertTrue(utilsResult.isEqual(to: lengthString))
    }
    
    func testAttributeMeasurementDolar() throws {
        let value = "500"
        let unit = "$"
        let string = NSMutableAttributedString(string: unit, attributes: unitAttribute)
        let valueString = NSAttributedString(string: value, attributes: mainAttribute)
        string.append(valueString)
        
        let utilsResult = Utils.attributeMeasurement("\(unit)\(value)", unit: unit)!
        XCTAssertTrue(utilsResult.isEqual(to: string))
    }
}
