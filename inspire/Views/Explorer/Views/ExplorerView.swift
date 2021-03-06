//
//  ExplorerView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ExplorerView: View {
    
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var quiz : Quiz
    @State private var selectedCategory: Int = 0
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = experiencesCategories
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    @State private var selectedTags = SharedExperiences().experiences[0].category.selectedTags
    var searchResults : [Experience] { sharedExperiences.search(searchText: searchText) }
    @State private var showSearch = false
    
    
    var body: some View {
       
        NavigationView {
                VStack {
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
                        if selectedCategory == 0 {
                        SegmentedControlView(selectorIndex: $selectedCategory)
                            .padding(.top, 10)
                        }
                    }
                    
                    if selectedCategory == 0 {
                        ScrollView {
                            if !searchText.isEmpty {
                                SectionTitle(content: "\(searchResults.count) \(searchResults.count > 1 ? "exp??riences" : "exp??rience") \( searchResults.count > 1 ? "trouv??es": "trouv??e")")
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
                                SectionTitle(content: "Les plus r??serv??es")
                                    .font(.title3).padding(.leading)
                                Spacer()
                            }
                            ExperienceList(experiences: sharedExperiences.leftExperiences)
                            
                            HStack {
                                SectionTitle(content: "Nouveaut??s de la semaine")
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
                                        Text("Aucun r??sultat disponible pour ???\(searchText)\"")
                                            .font(.callout)
                                        
                                    }.foregroundColor(.red.opacity(0.7))
                                }
                            }
                        }
                    } else {
                        MapView(selectedCategory: $selectedCategory)
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
                                                    
                                            } else {
                                                Image(systemName: "magnifyingglass.circle.fill")
                                                    .resizable()
                                                    .foregroundColor(.customPrimary)
                                                    .frame(width: 30, height: 30)
                                                    
                                            }
                                        })
                )
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

