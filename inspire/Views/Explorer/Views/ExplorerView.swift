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
    let experiences: ExperienceCategory
    let experience: [Experience]
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = experiencesCategories
    @EnvironmentObject var quiz : Quiz
    @Binding var showQuiz : Bool
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    @State private var selectedTags = SharedExperiences().experiences[0].category.selectedTags
    var searchResults : [Experience] { sharedExperiences.search(searchText: searchText) }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        VStack (alignment: .leading) {
                            VStack  (alignment: .leading) {
                                SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                                    .padding(.trailing).padding(.leading)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    Divider()
                                    SegmentedControlView(selectorIndex: $selectedCategory)
                                    Divider()
                                }
                                if selectedCategory == 0 {
                                    VStack {
                                        ForEach(tags.indices, id: \.self) { idx in
                                            //                                            if !tags[idx].isSelected {
                                            CategoryFilter(tag: $tags[idx], searchText: $searchText)
                                                .padding(2)
                                            //                                            }
                                        }
                                    }
                                }
                                .padding(.leading).padding(.top, 5)
                                Divider().padding(.top)
                                //                                ScrollView(.horizontal, showsIndicators: false) {
                                //                                    HStack {
                                ForEach(tags.indices, id: \.self) { idx in
                                    //                                            if !tags[idx].isSelected {
                                    CategoryFilter(tag: $tags[idx], searchText: $searchText)
                                        .padding(2)
                                    //                                            }
                                }
                                //                                    }.padding(.leascading)
                            }
                            .padding(.leading).padding(.top, 5)
                            Divider().padding(.top)
                            //                                ScrollView(.horizontal, showsIndicators: false) {
                            //                                    HStack {
                            //                                        ForEach(selectedTags.indices, id: \.self) { idx in
                            //                                            if selectedTags[idx].isSelected {
                            //                                                CategoryFilter(tag: $tags[idx])
                            //                                                    .padding(2)
                            //                                            }
                            //                                        }
                            //                                    }.padding(.leascading)
                            //                                }
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
                                ForEach(searchResults) { experience in
                                    if searchResults.isEmpty && (inSearchmode) {
                                        Text("aucun résultat disponible pour \(searchText)")
                                    }
                                    else if !searchResults.isEmpty && (inSearchmode || !selectedTags.isEmpty){
                                        Text("\(searchResults.count) réultat(s)")
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
                                    //                                HStack {
                                }.padding()
                                //
                                //                            HStack {
                                //                                SectionTitle(content: "Nouveautés de la semaine")
                                //                                    .font(.title3).padding(.leading)
                                //                                Spacer()
                                //                                SeeMoreButton()
                                //                                    .padding(.trailing)
                                //                            }
                                //
                                //                            ScrollView(.horizontal, showsIndicators: false) {
                                //                                HStack {
                                //                                    ForEach(sharedExperiences.experiences, id: \.id) { experience in
                                //                                        ExperienceCard(experience: experience)
                                //                                            .padding(.leading).padding(.top, 6)
                                //                                    }
                                //                                }
                                //                            }.padding()
                            } else {
                                //                                MapView()
                            }
                            Divider().padding(.top)
                            //                                            .padding(.leading).padding(.top, 6)
                            //                                    }
                            //                                }
                            //                                else if !inSearchmode {
                            //                                    ForEach(experiencesCategories, id: \.self) { experience in
                            //                                        ExperienceCard(experienceCategory: experience)
                            //                                            .padding(.leading).padding(.top, 6)
                            //                                    }
                            //                                }
                            //                            }
                            //                        }.padding()
                        }
                        
                        MapButton(showMap: false).offset(y: -30)
                        
                    }
                    EmptyView()
                        .fullScreenCover(isPresented: $showQuiz, content: {
                            Flow()
                            
                        })
                }.navigationTitle("Accueil")
                
            }
        }
    }
}
struct ExplorerView_Preiews: PreviewProvider {
    
    static var previews: some View {
        ExplorerView(showMap: .constant(false), showQuiz: .constant(false))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}

