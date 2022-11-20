//
//  GoodServiceApp.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 20.11.2022.
//

import SwiftUI

@main
struct GoodServiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
