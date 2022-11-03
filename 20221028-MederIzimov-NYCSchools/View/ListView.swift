//
//  ListView.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct ListView: View {
    @StateObject var router = ListViewModel()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SchoolView(viewModel: router.schoolListViewModel)
        }
    }
}

