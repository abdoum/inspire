//
//  UserHistoryList.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct UserHistoryList: View {
    let experiences: [Experience]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(experiences) { experience in
                    NavigationLink(destination: ExperienceDetails(experiences: Experience.init(author: experience.author, price: experience.price, category: experience.category, title: experience.title, description: experience.description, rate: experience.rate))) {
                        MyExperiencesCard(experienceCategory: experience)
                            .padding(.bottom)
                    }
                }
            }
        }
    }
}

struct UserHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryList(experiences: MOCK_EXPERIENCES)
    }
}
