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
    var specialisations: String
}

var experiencesCategories : [ExperienceCategory] =
    [
        ExperienceCategory(name: "Ingénieur", image: "ingenierie", specialisations: "Ingénieur"),
        ExperienceCategory(name: "Boulanger", image: "boulanger", specialisations: "Boulanger"),
        ExperienceCategory(name: "Fleuriste", image: "fleuriste", specialisations: "Fleuriste"),
        ExperienceCategory(name: "Hôtellerie", image: "hotellerie", specialisations: "Hôtesse d'Accueil"),
        ExperienceCategory(name: "Coiffeur", image: "coiffeur", specialisations: "Coiffeur"),
        ExperienceCategory(name: "Vétérinaire", image: "veterinaire", specialisations: "Vétérinaire"),
        ExperienceCategory(name: "Art", image: "artistique", specialisations: "Peintre"),
        ExperienceCategory(name: "Architecte", image: "architecture", specialisations: "Architecte"),
        ExperienceCategory(name: "Pompier", image: "pompiers", specialisations: "Sapeur Pompier"),
        ExperienceCategory(name: "Photographe", image: "photographie", specialisations: "Photographe")
    ]

var mainCategoriesTags : [FilterTag] {
    var tags = [FilterTag]()
    for category in experiencesCategories {
        tags.append(FilterTag(text: category.name, isSelected: false))
    }
    return tags
}
