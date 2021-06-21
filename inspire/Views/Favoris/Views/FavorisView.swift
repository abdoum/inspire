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
    @EnvironmentObject var experiences: SharedExperiences
    @State var searchText = ""
    @State var inSearchmode = false
    @State private var tag = FilterTagModel(text: "", isSelected: false)
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        VStack  (alignment: .leading) {
                            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
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
                                ForEach(experiences.experiences, id: \.id) { experience in
                                    ExperienceCard(experience: experience)
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
                                ForEach(experiences.experiences, id: \.id) { experience in
                                    Image(experience.category.image)
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
                                ForEach(experiences.experiences, id: \.id) { experience in
                                    ExperienceCard(experience: experience)
                                        .padding(.leading).padding(.top, 6)
                                }
                            }
                        }
                        SectionTitle(content: "Mots-clés").font(.title3).padding(.leading).padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categoryArray, id: \.self) { _ in
                                    CategoryFilter(tag: $tag, searchText: $searchText)
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
        FavorisView()
    }
}
