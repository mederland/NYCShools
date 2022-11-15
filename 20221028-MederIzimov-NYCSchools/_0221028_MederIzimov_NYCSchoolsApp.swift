//
//  _0221028_MederIzimov_NYCSchoolsApp.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/28/22.
//

import SwiftUI

@main
struct _0221028_MederIzimov_NYCSchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationShellView()
            } else {
                fatalError("This Xcode or iPhone is too old")
            }
        }
    }
}
