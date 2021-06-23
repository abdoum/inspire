//
//  UserHistoryList.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct UserHistoryList: View {
    
    @State private var isPresented: Bool = false
    @Binding var experiences : [Experience]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(experiences) { experience in
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        MyExperiencesCard(experienceCategory: experience)
                    }).fullScreenCover(isPresented: $isPresented, content: {
                        ExperienceDetails(experience: Experience.init(author: experience.author, price: experience.price, category: experience.category, title: experience.title, description: experience.description, rate: experience.rate, location: experience.location))
                    })
                }
            }
        }
    }
}



struct UserHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryList(experiences: .constant(MOCK_EXPERIENCES))
            .environmentObject(FavorisManager())
            .environmentObject(SharedExperiences())
    }
}
