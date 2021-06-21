//
//  ExplorerView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ExplorerView: View {
    
    @State private var selectedCategory: Int = 0
    let experiences: ExperienceCategory
    let experience: [Experience]
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        VStack (alignment: .leading) {
                            VStack  (alignment: .leading) {
                                SearchView()
                                    .padding(.trailing).padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(categoryArray, id: \.self) { _ in
                                            CategoryFilter()
                                                .padding(.leading).padding(.top, 6)
                                        }
                                    }
                                }
                                CategoryFilter()
                                    .padding(.leading).padding(.top, 5)
                                Divider()
                                SegmentedControlView(selectorIndex: $selectedCategory)
                                Divider()
                            }
                            if selectedCategory == 0 {
                                VStack {
                                    HStack {
                                        SectionTitle(content: "Nouveautés de la semaine")
                                            .font(.title3).padding(.leading)
                                        Spacer()
                                        SeeMoreButton()
                                            .padding(.trailing)
                                    }
                                    ExperienceList(experiences: MOCK_EXPERIENCES)
                                    Spacer(minLength: 30)
                                    
                                    HStack {
                                        SectionTitle(content: "Les plus réservées")
                                            .font(.title3).padding(.leading)
                                        Spacer()
                                        SeeMoreButton()
                                            .padding(.trailing)
                                    }
                                    ExperienceList(experiences: MOCK_EXPERIENCES)
                                }
                            } else {
                                MapView()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ExplorerView_Preiews: PreviewProvider {
    static var previews: some View {
        ExplorerView(experiences: experiencesCategories[1], experience: MOCK_EXPERIENCES)
    }
}
