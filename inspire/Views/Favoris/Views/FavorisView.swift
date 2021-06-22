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
    @State var searchText = ""
    @State var inSearchmode = false
    @State private var tag = FilterTag(text: "", isSelected: false)
    @EnvironmentObject var favorisManager: FavorisManager
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        VStack  (alignment: .leading) {
                            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                                .padding()
                            VStack {
                                ForEach(favorisManager.favoris) {
                                    PopupHomepage(experience: $0)
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
        FavorisView(experienceCategory: experiencesCategories[0]).environmentObject(FavorisManager())
    }
}
