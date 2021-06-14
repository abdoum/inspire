//
//  ExperienceCategories.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct ExperienceCategory {
    let name : String
    let image : String
    var specialisations : [String] = []
}



var EXPERIENCE_CATEGORIES : [ExperienceCategory] = [
    ExperienceCategory(name: "food", image: "boulanger", specialisations: ["boulangerie", "restauration", "agro-alimentaire"]),
    ExperienceCategory(name: "it", image: "ingenierie", specialisations: ["software development", "data scientist"]),
]
