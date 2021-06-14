//
//  Step.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Step: View {
    @State private var selectedExperienceCategory : String = ""
    let experienceCategories : [ExperienceCategory] = EXPERIENCE_CATEGORIES
    var body: some View {
        VStack{
            ForEach(experienceCategories.indices, id:\.self){idx in
                QuizTitle(content: experienceCategories[idx].name)
            }

        }
    }
}

struct Step_Previews: PreviewProvider {
    static var previews: some View {
        Step()
    }
}
