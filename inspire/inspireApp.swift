//
//  inspireApp.swift
//  inspire
//
//  Created by ab on 10/06/2021.
//

import SwiftUI

@main
struct inspireApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MasterLogin()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
