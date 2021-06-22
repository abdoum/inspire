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
    @EnvironmentObject var quiz : Quiz
    @AppStorage("totalSteps") var totalSteps = 4
    
    var body: some Scene {
        WindowGroup {
            MasterView( showQuiz: .constant(false))
                .environmentObject(UserManager())
                .environmentObject(FavorisManager())
                .environmentObject(ImageLoader(urlString: ""))
                .environmentObject(Quiz())
                .environmentObject(SharedExperiences())
        }
    }
}
