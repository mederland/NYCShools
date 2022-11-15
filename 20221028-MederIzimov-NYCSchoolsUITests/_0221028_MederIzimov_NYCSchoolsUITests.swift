//
//  _0221028_MederIzimov_NYCSchoolsUITests.swift
//  20221028-MederIzimov-NYCSchoolsUITests
//
//  Created by Consultant on 10/28/22.
//

import XCTest

class _0221028_MederIzimov_NYCSchoolsUITests: XCTestCase {

    func testBasicNavigation() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 1)
        app.scrollViews.otherElements.buttons["Brooklyn School for Music & Theatre"].tap()
        
        Thread.sleep(forTimeInterval: 3)
        
    }
    
    func testMultiDirectionNavigation() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        Thread.sleep(forTimeInterval: 1)
        app.scrollViews.otherElements.buttons["Women's Academy of Excellence"].tap()
        
        Thread.sleep(forTimeInterval: 3)
    }
    
}
