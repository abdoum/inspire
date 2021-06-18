//
//  ExperiencesView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct UserHistoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
//                    TitleScreen(content: "Expériences").padding()
                    SearchView().padding(.trailing).padding(.leading)
                    SectionTitle(content: "Ce mois-ci :").padding(.top).padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(experiencesCategories, id: \.self) { _ in
                                ExperienceCard(experienceCategory: experiencesCategories[2])
                                    .padding(.leading).padding(.top, 6)
                            }
                        }
                    }.padding()
                    SectionTitle(content: "Cette semaine :").padding(.top).padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(experiencesCategories, id: \.self) { _ in
                                ExperienceCard(experienceCategory: experiencesCategories[2])
                                    .padding(.leading).padding(.top, 6)
                            }
                        }
                    }.padding()
                }
            }
            .navigationTitle("Experiences")
        }
    }
}

struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryView()
    }
}
