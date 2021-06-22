//
//  ExplorerView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ExplorerView: View {
    
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @State private var selectedCategory: Int = 0
    let experiencesCategory: ExperienceCategory
    //    let experience: [Experience]
    
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = experiencesCategories
    @EnvironmentObject var quiz : Quiz
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    @State private var selectedTags = SharedExperiences().experiences[0].category.selectedTags
    var searchResults : [Experience] { sharedExperiences.search(searchText: searchText) }
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                    .padding(.trailing).padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tags.indices, id: \.self) { idx in
                            CategoryFilter(tag: $tags[idx], searchText: $searchText)
                                .padding(2)
                        }
                    }
                }
                .padding(.leading).padding(.top, 5)
                Divider().padding(.top)
                HStack {
                    SectionTitle(content: "\(searchResults.count) \(searchResults.count > 1 ? "résultats" : "résultat") \( searchResults.count > 1 ? "trouvés": "trouvé")")
                        .font(.title3).padding(.leading)
                    Spacer()
                    SeeMoreButton()
                        .padding(.trailing)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        if !searchResults.isEmpty && (inSearchmode || !selectedTags.isEmpty){
                            ForEach(searchResults){experience in
                                ExperienceCard(experience: experience)
                                    .padding(.leading).padding(.top, 6)
                            }
                        }
                        else if !inSearchmode {
                            ForEach(searchResults) { experience in
                                ExperienceCard(experience: experience)
                                    .padding(.leading).padding(.top, 6)
                            }
                        }
                    }
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
                        ForEach(sharedExperiences.experiences) { experience in
                            ExperienceCard(experience: experience)
                                .padding(.leading).padding(.top, 6)
                        }
                    }
                }
                .padding(.trailing)
                
                HStack {
                    SectionTitle(content: "Nouveautés de la semaine")
                        .font(.title3).padding(.leading)
                    Spacer()
                    SeeMoreButton()
                        .padding(.trailing)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(sharedExperiences.experiences) { experience in
                            ExperienceCard(experience: experience)
                                .padding(.leading).padding(.top, 6)
                        }
                    }
                }
                if searchResults.isEmpty && (inSearchmode) {
                    HStack {
                        VStack{
                            Image(systemName: "exclamationmark.icloud.fill")
                                .font(.system(size: 42))
                                .padding()
                            Text("Aucun résultat disponible pour ”\(searchText)\"")
                                .font(.callout)
                            
                        }.foregroundColor(.red.opacity(0.7))
                    }
                }
            }
            EmptyView()
                .fullScreenCover(isPresented: $quiz.params.skipQuiz, content: {
                    Flow()
                })
        }.navigationTitle("Accueil")
    }
}


struct ExplorerView_Preiews: PreviewProvider {
    
    static var previews: some View {
        ExplorerView()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}

