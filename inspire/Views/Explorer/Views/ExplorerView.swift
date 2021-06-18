//
//  ExplorerView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

func search(searchText: String) -> [Optional<ExperienceCategory>] {
    let results : [Optional<ExperienceCategory>] = experiencesCategories.filter(
        { searchText.isEmpty ? true : $0.name.contains(searchText) })
    if  (!results.isEmpty) {
        return results
    }else{
        return []
    }
}

struct ExplorerView: View {
    
    @Binding var showMap: Bool
    var experiences: ExperienceCategory
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = mainCategoriesTags
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        VStack (alignment: .leading) {
                            VStack  (alignment: .leading) {
                                SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                                    .padding(.trailing).padding(.leading)
//                                ScrollView(.horizontal, showsIndicators: false) {
//                                    HStack {
//                                        ForEach(mainCategories, id: \.self) { tag in
//                                            CategoryFilters(tag: mainCategories[tag])
//                                                .padding(.leading).padding(.top, 6)
//                                        }
//                                    }
//                                }
                                //                                CategoryFilters()
                                //                                    .padding(.leading).padding(.top, 5)
                                Divider().padding(.top)
                            }
                            HStack {
                                SectionTitle(content: "Les plus réservées")
                                    .font(.title3).padding(.leading)
                                Spacer()
                                SeeMoreButton()
                                    .padding(.trailing)
                            }
                            
                            Text("is editing: \(String(inSearchmode))")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    let searchResults = search(searchText: searchText)
                                    if searchResults.isEmpty && inSearchmode {
                                        Text("aucun résultat disponible pour \(searchText)")
                                    }
                                    else if !searchResults.isEmpty && inSearchmode {
                                        ForEach(searchResults, id: \.self) { result in
                                            ExperienceCard(experienceCategory: result ?? experiencesCategories[0])
                                                .padding(.leading).padding(.top, 6)
                                        }
                                    }
                                    else if !inSearchmode {
                                        ForEach(experiencesCategories, id: \.self) { experience in
                                            ExperienceCard(experienceCategory: experience)
                                                .padding(.leading).padding(.top, 6)
                                        }
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
