//
//  ExperienceList.swift
//  inspire
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct ExperienceList: View {
    
    let experiences: [Experience]
    @State private var isPresented: Bool = false

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(experiences) { experience in
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        ExperienceCard(experience: experience)
                    }).fullScreenCover(isPresented: $isPresented){
                        ExperienceDetails(experience: Experience.init(author: experience.author, price: experience.price, category: experience.category, title: experience.title, description: experience.description, rate: experience.rate, location: experience.location))
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
