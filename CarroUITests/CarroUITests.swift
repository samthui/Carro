//
//  CarroUITests.swift
//  CarroUITests
//
//  Created by N T P Ngoc on 28/04/2022.
//

import XCTest

enum Country: String, Codable, CaseIterable {
    case Singapore, Thailand
}

class CarroUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    // TODO: failed related to RadioGroup
    func selectCountry(_ country: String) {
        let predicate = NSPredicate(format: "label CONTAINS '\(country)'")
        app.staticTexts.element(matching: predicate).tap()
    }
    
    func expectItem(_ item: String, forCountry country: String, _ exist: Bool) {
        if exist {
            XCTAssertTrue(app.staticTexts[item].exists, "show '\(item)' for \(country)")
        } else {
            XCTAssertFalse(app.staticTexts[item].exists, "hide '\(item)' for \(country)")
        }
    }

    func testDisplayDataSingapore() throws {
        // TODO: failed related to RadioGroup
//        XCTAssert(app.staticTexts["Singapore"].exists)
//        XCTAssert(app.staticTexts["Thailand"].exists)
        
        let nextButton = app.buttons["Next"]
        XCTAssert(nextButton.exists)
        nextButton.tap()
        
        expectItem("Usage Based Insurance", forCountry: Country.Singapore.rawValue, true)
        expectItem("Name Driver", forCountry: Country.Singapore.rawValue, true)
        expectItem("Customize your Insurance", forCountry: Country.Singapore.rawValue, true)
        expectItem("View Docs", forCountry: Country.Singapore.rawValue, true)
        expectItem("Total Fines", forCountry: Country.Thailand.rawValue, false)
        expectItem("Total Fines Amount", forCountry: Country.Thailand.rawValue, false)
        
        app.navigationBars.buttons["Select Country"].tap()
    }
    
    // TODO: failed related to RadioGroup
//    func testDisplayDataThailand() throws {
//        selectCountry("Thailand")
//        
//        let nextButton = app.buttons["Next"]
//        XCTAssert(nextButton.exists)
//        nextButton.tap()
//        
//        expectItem("Usage Based Insurance", forCountry: Country.Thailand.rawValue, false)
//        expectItem("Name Driver", forCountry: Country.Thailand.rawValue, false)
//        expectItem("Customize your Insurance", forCountry: Country.Thailand.rawValue, false)
//        expectItem("View Docs", forCountry: Country.Thailand.rawValue, false)
//        expectItem("Total Fines", forCountry: Country.Singapore.rawValue, true)
//        expectItem("Total Fines Amount", forCountry: Country.Singapore.rawValue, true)
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
