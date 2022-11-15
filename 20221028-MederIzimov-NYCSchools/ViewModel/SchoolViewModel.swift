//
//  SchoolViewModel.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
class SchoolViewModel: ObservableObject {
    
    @Published var schools = [UISchool]()
    @Published var isLoading = false
    @Published var showingNoSATAlert = false
    @Published var showingErrorAlert = false
    
    private let databaseManager = DatabaseManager()
    
    let router: NavigationShellViewModel
    init(router: NavigationShellViewModel) {
        self.router = router
        initializationSequence()
    }
    
    func initializationSequence() {
        Task {
            
            await MainActor.run {
                isLoading = true
            }
            
            await databaseManager.loadPersistentStores()
            
            var nwSchools = [NWSchool]()
            do {
                nwSchools = try await fetchSchools()
            } catch let error {
                print("ERROR: fetchSchools: \(error.localizedDescription)")
            }
            
            if nwSchools.count > 0 {
                do {
                    try await databaseManager.updateData(nwSchools: nwSchools)
                } catch let error {
                    print("ERROR: updateData: \(error.localizedDescription)")
                }
            }
            
            var dbSchools = [DBSchool]()
            do {
                dbSchools = try await databaseManager.fetchSchools()
            } catch let error {
                print("ERROR: fetchSchools: \(error.localizedDescription)")
            }
            
            let uiSchools = dbSchools.map {
                UISchool(dbSchool: $0)
            }
            
            print("uiSchools = \(uiSchools)")
            
            await MainActor.run {
                self.schools = uiSchools
                isLoading = false
            }
            
        }
    }
    
    func fetchSchools() async throws -> [NWSchool] {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let nwSchools = try JSONDecoder().decode([NWSchool].self, from: data)
        return nwSchools
    }
    
    
    func selectSchoolIntent(model: UISchool) {
        Task {
            do {
                try await selectSchoolIntentBackground(model: model)
            } catch {
                await MainActor.run {
                    self.isLoading = false
                }
            }
        }
    }
 
    func testScoresForSchool(model: UISchool) async throws -> TestScores? {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(model.dbn)"
        
        guard let url = URL(string: urlString) else {
            await MainActor.run {
                self.isLoading = true
            }
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let responseSAT = try JSONDecoder().decode([TestScores].self, from: data)
        
        var testScores: TestScores?
        for checkScores in responseSAT {
            if checkScores.dbn == model.dbn {
                testScores = checkScores
            }
        }
        
        return testScores
    }
    
    private func selectSchoolIntentBackground(model: UISchool) async throws {
        
        await MainActor.run {
            self.isLoading = true
        }
        
        guard let testScores = try await testScoresForSchool(model: model) else {
            await MainActor.run {
                self.showingNoSATAlert = true
                self.isLoading = false
            }
            return
        }
        
        await MainActor.run {
            self.isLoading = false
            self.navigateToDetailPage(model: model, testScores: testScores)
        }
    }
    
    func navigateToDetailPage(model: UISchool, testScores: TestScores) {
        let detailViewModel = DetailViewModel(router: router,
                                              school: model,
                                              testScores: testScores)
        
        router.navigationPath.append(detailViewModel)
    }
    
    func name(for school: UISchool) -> String {
        return school.school_name
    }
    
    func dbn(for school: UISchool) -> String {
        return school.dbn
    }
    
}
