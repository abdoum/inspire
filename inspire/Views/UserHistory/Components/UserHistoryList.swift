//
//  UserHistoryList.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI


struct UserHistoryList: View {
    
    @State private var isPresented: Bool = false
    let experiences : [Experience]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(experiences, content: MyExperienceListButton.init)
            }
        }
    }
}

struct MyExperienceListButton: View {
    
    let experience: Experience
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            MyExperiencesCard(experience: experience)
                .padding(.bottom, 2)
        })
        .fullScreenCover(isPresented: $isPresented){
            ExperienceDetails(experience: experience)
        }
    }
}

struct UserHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryList(experiences: MOCK_EXPERIENCES)
            .environmentObject(FavorisManager())
            .environmentObject(SharedExperiences())
    }
}
