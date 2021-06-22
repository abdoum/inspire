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
            HStack {
                ForEach(experiences, content: ExperienceListButton.init)
            }.padding(.horizontal, 16)
        }
    }
}

struct ExperienceListButton: View {
    
    let experience: Experience
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            ExperienceCard(experience: experience)
        })
        .fullScreenCover(isPresented: $isPresented){
            ExperienceDetails(experience: experience)
        }
    }
}

struct ExperienceList_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceList(experiences: MOCK_EXPERIENCES)
    }
}


//        .sheet(isPresented: $isPresented){
//            ExperienceDetails(experience: experience)
//        }
