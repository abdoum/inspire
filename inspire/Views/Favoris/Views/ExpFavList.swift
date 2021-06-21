//
//  ExpFavList.swift
//  inspire
//
//  Created by Jonathan Duong on 21/06/2021.
//

//import SwiftUI
//
//struct ExpFavList: View {
//    @State private var showFavoritesOnly = true
//
//    var filteredExperiences: [Experience] {
//        experiences.filter { experience in
//            (!showFavoritesOnly || experience.isFavorite)
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            List(filteredExperiences) { experience in
//                NavigationLink(destination: ExperienceDetails(experiences: experience)) {
//                    ExperienceCard(experienceCategory: MOCK_EXPERIENCES[0])
//                }
//            }
//            .navigationTitle("Favoris")
//        }
//    }
//}
//
//struct ExpFavList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpFavList()
//    }
//}
