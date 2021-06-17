//
//  Suggestions.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct Suggestions: View {
    @EnvironmentObject var sharedExperiences: SharedExperiences
    var body: some View {
//        let experiences = sharedExperiences.experiences
        VStack{
//            Slider()(value: 0...5, label: {experience in
//                Suggestion(experience: experience)
//            })
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Text("Navigate")
                })
        }
    }
}

struct Suggestions_Previews: PreviewProvider {
    static var previews: some View {
        Suggestions()
            .environmentObject(SharedExperiences())
    }
}
