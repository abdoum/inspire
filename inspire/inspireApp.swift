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
    @AppStorage("totalSteps") var totalSteps = 4
    
    var body: some Scene {
        WindowGroup {
            MasterView()
                .environmentObject(UserManager())
                .environmentObject(Quiz())
                .environmentObject(SharedExperiences())
        }
    }
}
