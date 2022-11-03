//
//  DatabaseManager.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/31/22.
//

import Foundation
import CoreData

class DatabaseManager {
    
    let container: NSPersistentContainer
    required init() {
        container = NSPersistentContainer(name: "Database")
    }
    
    func loadPersistentStores() async {
        await withCheckedContinuation { continuation in
            container.loadPersistentStores { description, error in
                continuation.resume()
            }
        }
    }
    
    func fetchSchools() async throws -> [DBSchool] {
        let context = container.viewContext
        var result = [DBSchool]()
        try await context.perform {
            let fetchRequest = DBSchool.fetchRequest()
            result = try context.fetch(fetchRequest)
        }
        return result
    }
    
    
    func updateData(nwSchools: [NWSchool]) async throws {
        let context = container.viewContext
        try await context.perform {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBSchool")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try context.execute(batchDeleteRequest)
            
            for nwSchool in nwSchools {
                let dbSchool = DBSchool(context: context)
                dbSchool.dbn = nwSchool.dbn
                dbSchool.school_name = nwSchool.school_name
                
                dbSchool.primary_address_line_1 = nwSchool.primary_address_line_1
                dbSchool.city = nwSchool.city
                dbSchool.state_code = nwSchool.state_code
                dbSchool.zip = nwSchool.zip
                
            }
            try context.save()
        }
    }
    
}
