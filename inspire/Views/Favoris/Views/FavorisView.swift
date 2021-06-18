//
//  FavorisView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct FavorisView: View {
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    let experienceCategory: ExperienceCategory
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        VStack  (alignment: .leading) {
                            SearchView()
                                .padding()
                        }
                        HStack {
                            SectionTitle(content: "Mes listes")
                                .font(.title3).padding(.leading).padding()
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
                        }
                        
                        HStack {
                            SectionTitle(content: "Mes catégories")
                                .font(.title3).padding(.leading).padding()
                            Spacer()
                            SeeMoreButton().padding(.trailing)
                        }
                        ScrollView (.horizontal, showsIndicators: false)  {
                            HStack {
                                ForEach(experiencesCategories, id: \.self) { _ in
                                    Image(experienceCategory.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 220)
                                        .cornerRadius(25)
                                        .padding(.leading)
                                }
                            }
                        }
                        HStack {
                            SectionTitle(content: "Derniers ajouts")
                                .font(.title3).padding(.leading).padding()
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(experiencesCategories, id: \.self) { _ in
                                    ExperienceCard(experienceCategory: experiencesCategories[2])
                                        .padding(.leading).padding(.top, 6)
                                }
                            }
                        }
                        SectionTitle(content: "Mots-clés").font(.title3).padding(.leading).padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categoryArray, id: \.self) { _ in
                                    CategoryFilter()
                                        .padding(.leading).padding(.top, 6)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favoris")
        }
    }
}


struct FavorisView_Previews: PreviewProvider {
    static var previews: some View {
        FavorisView(experienceCategory: experiencesCategories[0])
    }
}
