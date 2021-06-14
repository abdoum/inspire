//
//  Quiz.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Quiz {
    var isFirstTimeUser : Bool
    var steps = [1...4]
    let existingMainExperienceCategories =  EXPERIENCE_CATEGORIES
    var skipQuiz : Bool = false
    var currentStep : Int = 1
    let existingExperienceLocationModes : [String] = LocationMode.allLocationModes
    let preferedLocationMode : LocationMode = .all
    let existingExperienceParticipationModes : [String] = ParticipationMode.allParticipationModes
    let preferedParticipationModes : ParticipationMode = .all
    let suggestions : [Experience] = []
}
