//
//  ExperienceCategories.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct ExperienceCategory: Hashable , Identifiable {
    let id = UUID()
    let name : String
    let image : String
    var specialisations : [String] = []
}

var experiencesCategories : [ExperienceCategory] =
    [
        ExperienceCategory(name: "Technology", image: "ingenierie", specialisations: ["Linemen", "Sheet Metal Worker", "Pipefitter", "Stucco Mason", "Terrazzo"]),
        ExperienceCategory(name: "Public Utilities", image: "boulanger", specialisations: ["Plasterers", "Sheet Metal Worker", "Terrazzo", "Electrician", "Sheet Metal Worker"]),
        ExperienceCategory(name: "Transportation", image: "bricolage", specialisations: ["Brickmason", "Plasterers", "Carpenter", "Carpenter", "Plasterers"])
    ]

var mainCategoriesTags : [FilterTag] {
    var tags = [FilterTag]()
    for category in experiencesCategories {
        tags.append(FilterTag(text: category.name, isSelected: false))
    }
    return tags
}
