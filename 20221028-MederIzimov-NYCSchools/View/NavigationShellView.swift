//
//  ListView.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct NavigationShellView: View {
    @StateObject var router = NavigationShellViewModel()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SchoolView(viewModel: router.schoolViewModel)
        }
    }
}

