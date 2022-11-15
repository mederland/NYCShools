//
//  _0221028_MederIzimov_NYCSchoolsTests.swift
//  20221028-MederIzimov-NYCSchoolsTests
//
//  Created by Consultant on 10/28/22.
//

import XCTest
@testable import _0221028_MederIzimov_NYCSchools

class _0221028_MederIzimov_NYCSchoolsTests: XCTestCase {
    
    func testSchoolFetch() async {
        if #available(iOS 16.0, *) {
            
            let viewModel = SchoolViewModel(router: .init())
            do {
                let schools = try await viewModel.fetchSchools()
                print("schools count = \(schools)")
                XCTAssert(schools.count > 1)
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
                let schools = try await viewModel.fetchSchools()
                var numberOfMatches = 0
                let numberOfSchools = schools.count
                let loops = min(10, numberOfSchools)
                for index in 0..<loops {
                    let school = schools[index]
                    let uiSchool = UISchool(dbn: school.dbn,
                                            school_name: school.school_name ?? "",
                                            primary_address_line_1: school.primary_address_line_1 ?? "",
                                            city: school.city ?? "",
                                            state_code: school.state_code ?? "",
                                            zip: school.zip ?? "")
                    let scores = try await viewModel.testScoresForSchool(model: uiSchool)
                    if scores != nil {
                        numberOfMatches += 1
                    }
                }
                print("numberOfMatches = \(numberOfMatches)")
                XCTAssert(numberOfMatches > 0)
            } catch {
                XCTFail("Network Fail")
            }
        } else {
            XCTFail("Device is too old.")
        }
    }

}
