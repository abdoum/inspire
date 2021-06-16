//
//  CategoriesList.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct StepOne: View {
    @EnvironmentObject var quiz : Quiz
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 25){
            ForEach(quiz.params.existingExperienceCategories.indices, id:\.self){idx in
                
                Button(action: {
                    quiz.params.preferedExperienceCategorie = quiz.params.existingExperienceCategories[idx].name
                    quiz.params.currentStep += 1
                }, label: {
                    Category(title: quiz.params.existingExperienceCategories[idx].name, numberOfExistingExperiences: 113, image: quiz.params.existingExperienceCategories[idx].image)
                })
            }
            Button(action: {
                quiz.params.preferedExperienceCategorie = quiz.params.existingExperienceCategories.randomElement()?.name ?? ""
                quiz.params.currentStep += 1
            }, label: {
                RandomCategory()
            })
        }.padding(.horizontal, 8)
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        StepOne()
            .environmentObject(Quiz())
    }
}
