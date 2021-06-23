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
    @StateObject var quiz = Quiz()
    @StateObject var experiences = SharedExperiences()
    
    var body: some Scene {
        WindowGroup {
            MasterView()
                .environmentObject(UserManager())
                .environmentObject(FavorisManager())
                .environmentObject(ImageLoader(urlString: ""))
                .environmentObject(Quiz())
                .environmentObject(SharedExperiences())
        }
    }
}
