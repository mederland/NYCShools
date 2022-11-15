//
//  NavigationShellViewModel.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

//Primary purpose: To serve as "router" and host the navigation
//for the app, using "NavigationPath"

@available(iOS 16.0, *)
class NavigationShellViewModel: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    
    lazy var schoolViewModel = {
        SchoolViewModel(router: self)
    }()
}
