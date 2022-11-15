//
//  ScoreViewModel.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
class DetailViewModel: ObservableObject {
    
    let router: NavigationShellViewModel
    let school: UISchool
    let testScores: TestScores
    @available(iOS 16.0, *)
    
    init(router: NavigationShellViewModel,
         school: UISchool,
         testScores: TestScores) {
        self.router = router
        self.school = school
        self.testScores = testScores
        print("DetailViewModel init")
    }
    
    deinit {
        print("DetailViewModel deinit")
    }
    
    func name(for school: UISchool) -> String {
        return school.school_name
    }
    
    func dbn(for school: UISchool) -> String {
        return school.school_name
    }
    
    func addressFirstLine(for school: UISchool) -> String {
        return school.primary_address_line_1
    }
    
    func addressSecondLine(for school: UISchool) -> String {
        let part1 = school.city
        let part2 = school.state_code
        let part3 = school.zip
        return "\(part1), \(part2) \(part3)"
    }
    
    func numberOfStudents(for sat: TestScores) -> String {
        return sat.num_of_sat_test_takers ?? ""
    }
    
    func criticalReading(for sat: TestScores) -> String {
        return sat.sat_critical_reading_avg_score ?? ""
    }
    
    func math(for sat: TestScores) -> String {
        return sat.sat_math_avg_score ?? ""
    }
    
    func writing(for sat: TestScores) -> String {
        return sat.sat_writing_avg_score ?? ""
    }
    
    func dismiss() {
        router.navigationPath.removeLast()
    }
}

@available(iOS 16.0, *)
extension DetailViewModel: Hashable {
    @available(iOS 16.0, *)
    static func == (lhs: DetailViewModel, rhs: DetailViewModel) -> Bool {
        lhs.school.id == rhs.school.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(school.id)
    }
}
