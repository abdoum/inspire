//
//  ExperienceList.swift
//  inspire
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct ExperienceList: View {
    
    let experiences: [Experience]
    
    var body: some View {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(experiences) { experience in
                        NavigationLink(destination: ExperienceDetails(experiences: Experience.init(author: experience.author, price: experience.price, category: experience.category, title: experience.title, description: experience.description, rate: experience.rate))) {
                            ExperienceCard(experienceCategory: experience)
                        }
                    }
                }
            }
    }
}

struct ExperienceList_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceList(experiences: MOCK_EXPERIENCES)
    }
}
