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
    @State private var showSearch = false
    var body: some View {
        NavigationView {
           
                VStack {
                    //HEADER
                    //                    ZStack{
                    //
                    //                        HStack {
                    //                            Spacer()
                    //
                    //
                    //                        }
                    //                    }
                    
                    if showSearch {
                        VStack {
                            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                                .padding(.trailing).padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(tags.indices, id: \.self) { idx in
                                        CategoryFilter(tag: $tags[idx], searchText: $searchText)
                                            .padding(.horizontal, 2)
                                    }
                                }
                            }
                            .padding(.leading)
                            
                        }
                    }else{
                        SegmentedControlView(selectorIndex: $selectedCategory)
                            .padding(.top, 10)
                    }
                    
                    
                    if selectedCategory == 0 {
                        ScrollView {
                            
                            if !searchText.isEmpty {
                                SectionTitle(content: "\(searchResults.count) \(searchResults.count > 1 ? "expériences" : "expérience") \( searchResults.count > 1 ? "trouvées": "trouvée")")
                                    .font(.title3).padding(.leading)
                                Spacer()
                                HStack {
                                    if !searchResults.isEmpty && (inSearchmode || !selectedTags.isEmpty){
                                        ExperienceList(experiences: searchResults)
                                    }
                                    else if !inSearchmode {
                                        ExperienceList(experiences: searchResults)
                                    }
                                    
                                }
                            } else {
                                EmptyView()
                            }
                            
                            
                            HStack {
                                SectionTitle(content: "Les plus réservées")
                                    .font(.title3).padding(.leading)
                                Spacer()
                            }
                            ExperienceList(experiences: sharedExperiences.leftExperiences)
                            
                            HStack {
                                SectionTitle(content: "Nouveautés de la semaine")
                                    .font(.title3).padding(.leading)
                                Spacer()
                            }
                            ExperienceList(experiences: sharedExperiences.rightExperiences)
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
                }.navigationTitle("Explorer")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            withAnimation(.easeInOut){
                                                showSearch.toggle()
                                            }
                                        }, label: {
                                            if !showSearch {
                                                Image(systemName: "magnifyingglass.circle")
                                                    .resizable()
                                                    .foregroundColor(.customPrimary)
                                                    .frame(width: 30, height: 30)
                                                    .padding(.horizontal)
                                            } else {
                                                Image(systemName: "magnifyingglass.circle.fill")
                                                    .resizable()
                                                    .foregroundColor(.customPrimary)
                                                    .frame(width: 30, height: 30)
                                                    .padding(.horizontal)
                                            }
                                        })
                )
                .fullScreenCover(isPresented: $quiz.params.skipQuiz, content: {
                    Flow()
                })
        }
       
    }
}


struct ExplorerView_Preiews: PreviewProvider {
    
    static var previews: some View {
        ExplorerView()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}

