//
//  FormatterExtensionTests.swift
//  CarroTests
//
//  Created by N T P Ngoc on 02/05/2022.
//

import XCTest
@testable import Carro

class FormatterExtensionTests: XCTestCase {
    func testFormatCurrency() throws {
        XCTAssertEqual(NumberFormatter.formatCurrency(0.0), "$0.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(-21.0), "-$21.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(-492.0), "-$492.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(-9520.0), "-$9,520.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(-1111111.0), "-$1,111,111.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(21.0), "$21.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(492.0), "$492.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(9520.0), "$9,520.00")
        XCTAssertEqual(NumberFormatter.formatCurrency(1111111.0), "$1,111,111.00")
    }
}
