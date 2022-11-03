//
//  ListViewModel.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
class ListViewModel: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    
    lazy var schoolListViewModel = {
        SchoolViewModel(router: self)
    }()
}
