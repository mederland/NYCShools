//
//  School.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import Foundation

struct NWSchool: Decodable {
    let dbn: String
    let school_name: String?
    let building_code: String?
    
    let primary_address_line_1: String?
    let city: String?
    let zip: String?
    let state_code: String?
    
    let school_email: String?
    let website: String?
}

extension NWSchool: Identifiable, Hashable {
    var id: String { dbn }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dbn)
    }
}
