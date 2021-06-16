//
//  Quiz.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct QuizParams   {
    var isFirstTimeUser : Bool = true
    var steps = [1 : "Que cherchez-vous ?", 2: "Vous préférez ?", 3: "Lieu ?", 4 : "Quelques suggestions"]
    let existingExperienceCategories =  EXPERIENCE_CATEGORIES
    var preferedExperienceCategorie : String? = nil
    var skipQuiz : Bool = false
    var isPresented : Bool = true
    var currentStep : Int = 1
    let existingExperienceLocationModes : [String] = LocationMode.allLocationModes
    var preferedExperienceLocationMode : LocationMode? = nil
    let existingExperienceParticipationModes : [String] = ParticipationMode.allParticipationModes
    var preferedExperienceParticipationMode : ParticipationMode? = nil
    let suggestions : [Experience] = []
}

class Quiz: ObservableObject {
    @Published var params = QuizParams()
}
