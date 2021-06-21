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
    @State private var selected : Int = 0
    @State private var shouldShowPurple : Bool = true
    @State private var showMap : Bool = false
    var body: some View {
        let experiences = sharedExperiences.experiences
        
        TabView(selection: $selected,
                content:  {
                    ForEach(experiences, id:\.id) {experience in
                        
                        //                        GeometryReader{reader in
                        NavigationLink(
                            destination: ExplorerView(experiences: experiencesCategories[1], experience: MOCK_EXPERIENCES),
                                            isActive: $shouldShowPurple
                                        ) {
                            Suggestion(experience: experience)
                                        }
                        
                        
                        //                        }
                        //                        .frame(height: height / 2)
                        //                        .padding(10)
                        //                        .padding(.horizontal,45)
                        
                    }
                })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        //        VStack{
        //            Slider()(value: 0...5, label: {experience in
        //                Suggestion(experience: experience)
        //            })
        
        //            NavigationLink(
        //                destination: Text("Destination"),
        //                label: {
        //                    Text("Navigate")
        //                })
        //        }
    }
}

struct Suggestions_Previews: PreviewProvider {
    static var previews: some View {
        Suggestions()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
