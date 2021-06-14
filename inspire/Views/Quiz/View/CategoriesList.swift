//
//  CategoriesList.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct CategoriesList: View {
    @Binding private var selectedExperienceCategory : String = ""
    let experienceCategories : [ExperienceCategory] = EXPERIENCE_CATEGORIES
    
    var body: some View {
        LazyVGrid{
            ForEach(experienceCategories.indices, id:\.self){idx in
                QuizTitle(content: experienceCategories[idx].name)
            }
        }
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
    }
}
