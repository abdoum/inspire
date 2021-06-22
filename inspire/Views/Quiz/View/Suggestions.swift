//
//  Suggestions.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct Suggestions: View {
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var quiz : Quiz
    @State private var showMap : Bool = false
    
    var bgColor : Color
    var body: some View {
        let experiences = sharedExperiences.experiences
        VStack{
            QuizPageTitle()
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(experiences, id:\.id) {experience in
                        NavigationLink(
                            destination: ExperienceDetails(experience: sharedExperiences.experiences[2])
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true),
                            label: {
                                Suggestion(experience: experience)
                                    .padding()
                            })
                    }
                }
            }
            Spacer()
        }
        .background(bgColor.ignoresSafeArea())
    }
}

struct Suggestions_Previews: PreviewProvider {
    static var previews: some View {
        Suggestions(bgColor: .green.opacity(0.3))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
