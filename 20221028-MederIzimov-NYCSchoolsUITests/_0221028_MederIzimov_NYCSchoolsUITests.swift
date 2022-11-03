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
        Thread.sleep(forTimeInterval: 6)
        app.scrollViews.otherElements.buttons["Brooklyn School for Music & Theatre"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
    }
    
    func testMultiDirectionNavigation() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        Thread.sleep(forTimeInterval: 6)
        app.scrollViews.otherElements.buttons["Women's Academy of Excellence"].tap()
        
        Thread.sleep(forTimeInterval: 6)
        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Back"].tap()
        
    }
    
}
