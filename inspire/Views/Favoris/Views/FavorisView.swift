//
//  FavorisView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct FavorisView: View {

    @EnvironmentObject var sharedExperiences: SharedExperiences
    @State var searchText = ""
    @State var inSearchmode = false
    @EnvironmentObject var favorisManager: FavorisManager
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    
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
            }.navigationTitle("Favoris")
        }
    }
}


struct FavorisView_Previews: PreviewProvider {
    static var previews: some View {
        FavorisView()
            .environmentObject(FavorisManager())
            .environmentObject(SharedExperiences())
    }
}
