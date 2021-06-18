//
//  ExplorerView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ExplorerView: View {
    
    @Binding var showMap: Bool
    var experiences: ExperienceCategory
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
                            Divider().padding(.top)
                        }
                        HStack {
                            SectionTitle(content: "Les plus réservées")
                                .font(.title3).padding(.leading)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(experiencesCategories, id: \.self) { _ in
                                    ExperienceCard(experienceCategory: experiencesCategories[1])
                                        .padding(.leading).padding(.top, 6)
                                }
                            }
                        }.padding()
                        
                        HStack {
                            SectionTitle(content: "Nouveautés de la semaine")
                                .font(.title3).padding(.leading)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(experiencesCategories, id: \.self) { _ in
                                    ExperienceCard(experienceCategory: experiencesCategories[0])
                                        .padding(.leading).padding(.top, 6)
                                }
                            }
                        }.padding()
                    }
                }
                    MapButton(showMap: false).offset(y: -30)
                }
            }.navigationTitle("Accueil")
        }
    }
}

struct ExplorerView_Preiews: PreviewProvider {
    static var previews: some View {
        ExplorerView(showMap: .constant(false), experiences: experiencesCategories[1])
    }
}
