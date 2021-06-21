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
        ExperienceCategory(name: "Technologie", image: "ingenierie", specialisations: ["Linemen", "Sheet Metal Worker", "Pipefitter", "Stucco Mason", "Terrazzo"]),
        ExperienceCategory(name: "Intérêt Général", image: "boulanger", specialisations: ["Plasterers", "Sheet Metal Worker", "Terrazzo", "Electrician", "Sheet Metal Worker"]),
        ExperienceCategory(name: "Travaux", image: "coiffeur", specialisations: ["Charpentier", "Plombier", "Peintre", "Carreleur", "Ouvrier polyvalent"]),
        ExperienceCategory(name: "Science", image: "hotellerie", specialisations: ["Technicien de laboratoire", "Infirmier", "Aide soignante"]),
        ExperienceCategory(name: "Transport", image: "bricolage", specialisations: ["Brickmason", "Plasterers", "Carpenter", "Carpenter", "Plasterers"]),
        ExperienceCategory(name: "Alimentaire", image: "chocolatier_confiseur", specialisations: ["Restauration", "Pâtissierie", "Boulangerie"])
    ]


