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
    var specialisation: String
    var mainCategoriesTags : [FilterTagModel] {
        var tags = Array<FilterTagModel>()
        for category in experiencesCategories {
            tags.append(FilterTagModel(text: category.name, isSelected: false))
        }
        return tags
    }
    var selectedTags : [FilterTagModel] {
        mainCategoriesTags.filter({$0.isSelected})
    }
}

var experiencesCategories : [ExperienceCategory] =
    [
        ExperienceCategory(name: "Ingénieur", image: "ingenierie", specialisation: "Ingénieur"),
        ExperienceCategory(name: "Boulanger", image: "boulanger", specialisation: "Boulanger"),
        ExperienceCategory(name: "Fleuriste", image: "fleuriste", specialisation: "Fleuriste"),
        ExperienceCategory(name: "Hôtellerie", image: "hotellerie", specialisation: "Hôtesse d'Accueil"),
        ExperienceCategory(name: "Coiffeur", image: "coiffeur", specialisation: "Coiffeur"),
        ExperienceCategory(name: "Vétérinaire", image: "veterinaire", specialisation: "Vétérinaire"),
        ExperienceCategory(name: "Art", image: "artistique", specialisation: "Peintre"),
        ExperienceCategory(name: "Architecte", image: "architecture", specialisation: "Architecte"),
        ExperienceCategory(name: "Pompier", image: "pompiers", specialisation: "Sapeur Pompier"),
        ExperienceCategory(name: "Photographe", image: "photographie", specialisation: "Photographe"),
        ExperienceCategory(name: "Agriculture", image: "eleveur_betail", specialisation: "Eleveur de bétail"),
        ExperienceCategory(name: "Ingénieurie", image: "usinewoman", specialisation: "Ingénieure automobile"),
        ExperienceCategory(name: "Menuiserie", image: "menuiserie", specialisation: "Menuisier"),
        ExperienceCategory(name: "Musique", image: "musique", specialisation: "Professeur de guitare"),
        ExperienceCategory(name: "Arts", image: "photographie", specialisation: "Photographe urbain"),
        ExperienceCategory(name: "Industrie", image: "soudureman", specialisation: "Ouvrier qualifié")
        
]

