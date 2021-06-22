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
    
    @State private var selectedCategory: Int = 0
    let experiencesCategory: ExperienceCategory
    //    let experience: [Experience]
    
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var mainCategories = mainCategoriesTags
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack (alignment: .leading) {
                        VStack  (alignment: .leading) {
                            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                                .padding(.trailing).padding(.leading)
                            Divider()
                            SegmentedControlView(selectorIndex: $selectedCategory)
                            Divider()
                        }
                        if selectedCategory == 0 {
                            ScrollView {
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


struct ExplorerView_Preiews: PreviewProvider {
    static var previews: some View {
        ExplorerView(experiencesCategory: experiencesCategories[1])
    }
}
