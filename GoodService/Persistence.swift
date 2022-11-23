//
//  Persistence.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 20.11.2022.
//

import CoreData

enum StatusTask: Int16 {
    case new = 0
    case diagnostics = 1
}

var idNumber = 0

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0..<10 {
            let newItem = Task(context: viewContext)
            idNumber += 1
            
            newItem.id = UUID()
            newItem.id2 = Int64(idNumber)
            newItem.brand = "DTS"
            newItem.diagnosticBool = false
            newItem.model = "Raptor"
            newItem.problem = "Пизда рулю. Пизда рулю и седлу"
            newItem.serialNumber = "HFGY97RBCLOCB86"
            newItem.status = StatusTask.new.rawValue
            newItem.timestamp = Date()
            
            let newClient = Client(context: viewContext)
            newClient.name = "Tim"
            newClient.surname = "Cook"
            newClient.phone = "+7-777-777-77-77"
            
            newItem.client = newClient
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "GoodServiceV2")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                print(error.localizedDescription)
                
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
