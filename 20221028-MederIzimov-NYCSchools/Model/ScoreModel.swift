//
//  ScoreModel.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import Foundation

struct TestScores: Decodable {
    let dbn: String
    
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
    
    let num_of_sat_test_takers: String?
}
