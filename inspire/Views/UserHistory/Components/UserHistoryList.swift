//
//  UserHistoryList.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct UserHistoryList: View {
    let experiences: [Experience]
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(experiences) { experience in
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        MyExperiencesCard(experienceCategory: experience)
                    }).fullScreenCover(isPresented: $isPresented, content: {
                        ExperienceDetails(experiences: Experience.init(author: experience.author, price: experience.price, category: experience.category, title: experience.title, description: experience.description, rate: experience.rate))
                    })
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
