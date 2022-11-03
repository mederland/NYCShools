//
//  _0221028_MederIzimov_NYCSchoolsTests.swift
//  20221028-MederIzimov-NYCSchoolsTests
//
//  Created by Consultant on 10/28/22.
//

import XCTest
@testable import _0221028_MederIzimov_NYCSchools

class _0221028_MederIzimov_NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSchoolFetch() async {
        if #available(iOS 16.0, *) {
            
            let viewModel = SchoolViewModel(router: .init())
            do {
                try await viewModel.fetch()
                XCTAssert(viewModel.schools.count > 1)
            } catch {
                XCTFail("Network Fail")
            }
        } else {
            // Fallback on earlier versions
            XCTFail("Device is too old.")
        }
        
    }
    
    func testSATFetch() async {
        if #available(iOS 16.0, *) {
            do {
                let viewModel = SchoolViewModel(router: .init())
                try await viewModel.fetch()
                var numberOfMatches = 0
                let numberOfSchools = viewModel.schools.count
                let loops = min(10, numberOfSchools)
                for index in 0..<loops {
                    let school = viewModel.schools[index]
                    let scores = try await viewModel.testScoresForSchool(model: school)
                    if scores != nil {
                        numberOfMatches += 1
                    }
                }
                XCTAssert(numberOfMatches > 0)
            } catch {
                XCTFail("Network Fail")
            }
        } else {
            XCTFail("Device is too old.")
        }
    }

}
