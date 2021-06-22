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
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = experiencesCategories
    @EnvironmentObject var quiz : Quiz
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    @State private var selectedTags = SharedExperiences().experiences[0].category.selectedTags
    var searchResults : [Experience] { sharedExperiences.search(searchText: searchText) }
    
    var body: some View {
        NavigationView {
            VStack {
                //HEADER
                VStack {
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
                    Divider()
                    SegmentedControlView(selectorIndex: $selectedCategory)
                    Divider()
                }
                if selectedCategory == 0 {
                    ScrollView {
                        HStack {
                            SectionTitle(content: "\(searchResults.count) \(searchResults.count > 1 ? "résultats" : "résultat") \( searchResults.count > 1 ? "trouvés": "trouvé")")
                                .font(.title3).padding(.leading)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        if !searchResults.isEmpty && (inSearchmode || !selectedTags.isEmpty){
                            ExperienceList(experiences: searchResults)
                        }
                        else if !inSearchmode {
                            ExperienceList(experiences: searchResults)
                        }
                        HStack {
                            SectionTitle(content: "Les plus réservées")
                                .font(.title3).padding(.leading)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        ExperienceList(experiences: sharedExperiences.experiences)
                            .padding(.trailing)
                        
                        HStack {
                            SectionTitle(content: "Nouveautés de la semaine")
                                .font(.title3).padding(.leading)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing)
                        }
                        ExperienceList(experiences: sharedExperiences.experiences)
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
                } else {
                    MapView()
                }
            }
        }
                .fullScreenCover(isPresented: $quiz.params.skipQuiz, content: {
                        Flow()
                    })
    }
}


struct ExplorerView_Preiews: PreviewProvider {
    
    static var previews: some View {
        ExplorerView()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}

