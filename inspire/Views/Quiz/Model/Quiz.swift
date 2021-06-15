//
//  Quiz.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct QuizParams   {
    var isFirstTimeUser : Bool = true
    var steps = [1 : "Que cherchez-vous ?", 2: "Lieu ?", 3: "Vous préférez ?", 4 : "Quelques suggestions"]
    let existingExperienceCategories =  EXPERIENCE_CATEGORIES
    var preferedExperienceCategorie = ""
    var skipQuiz : Bool = false
    var currentStep : Int = 1
    let existingExperienceLocationModes : [String] = LocationMode.allLocationModes
    var preferedExperienceLocationMode : LocationMode = .all
    let existingExperienceParticipationModes : [String] = ParticipationMode.allParticipationModes
    var preferedExperienceParticipationMode : ParticipationMode = .all
    let suggestions : [Experience] = []
}

class Quiz: ObservableObject {
    @Published var params = QuizParams()
}
