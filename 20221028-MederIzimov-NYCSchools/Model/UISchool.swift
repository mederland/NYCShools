//
//  UISchool.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/31/22.
//

import Foundation


struct UISchool {
    let dbn: String
    let school_name: String
    
    let primary_address_line_1: String
    let city: String
    let state_code: String
    let zip: String
    
    
    
    init(dbn: String,
         school_name: String,
         primary_address_line_1: String,
         city: String,
         state_code: String,
         zip: String
    ) {
        self.dbn = dbn
        self.school_name = school_name
        self.primary_address_line_1 = primary_address_line_1
        self.city = city
        self.state_code = state_code
        self.zip = zip
    }
    
    init(dbSchool: DBSchool) {
        self.init(dbn: dbSchool.dbn ?? "",
                  school_name: dbSchool.school_name ?? "",
                  primary_address_line_1: dbSchool.primary_address_line_1 ?? "",
                  city: dbSchool.city ?? "",
                  state_code: dbSchool.state_code ?? "",
                  zip: dbSchool.zip ?? "")
    }
    
}

extension UISchool: Identifiable {
    var id: String { dbn }
}
