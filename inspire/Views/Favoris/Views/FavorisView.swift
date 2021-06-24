//
//  FavorisView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct FavorisView: View {
    
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var favorisManager: FavorisManager
    @State var searchText = ""
    @State var inSearchmode = false
    @State private var tags = SharedExperiences().experiences[0].category.mainCategoriesTags
    let experience: [Experience]
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack  {
                        VStack   {
                            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                            VStack {
                                ForEach(favorisManager.favoris, content: MyFavorisListButton.init)
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Favoris")
    }
}

struct MyFavorisListButton: View {
    
    let experience: Experience
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        PopupHomepage(experience: experience)
            .onTapGesture {
                isPresented.toggle()
            }
            .fullScreenCover(isPresented: $isPresented, content: {
                ExperienceDetails(experience: experience)
            })
    }
}


struct FavorisView_Previews: PreviewProvider {
    static var previews: some View {
        FavorisView(experience: MOCK_EXPERIENCES)
            .environmentObject(FavorisManager())
            .environmentObject(SharedExperiences())
    }
}
