//
//  ExperienceDetails.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceDetails: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var favorisManager: FavorisManager
    let experience: Experience
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    VStack {
                        Image(experience.category.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .listRowInsets(EdgeInsets())
                        VStack {
                            AuthorMainInfos(author: experience.author, experience: experience)
                            ExperienceContact(language: experience.author.spokenLanguages)
                                .padding(.leading).padding(.trailing)
                            ExperienceProgram(experience.description, lineLimit: 6)
                            UserNeeds()
                            ExperienceReviews(reviews: experience.reviews)
                        }.padding(.horizontal, 8)
                    }
                }
                ExperiencePriceDates(experiences: experience)
                    .frame(maxWidth: .infinity)
            }.edgesIgnoringSafeArea(.all)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Circle()
                                            .frame(width: 50, height: 30)
                                            .foregroundColor(.white)
                                            .overlay(
                                                Image(systemName: "xmark")
                                                    .foregroundColor(.black)
                                            )
                                    }), trailing:
                                        FavorisButton(experience: experience, isLike: favorisManager.isLike(experience: experience))
            )
        }
    }
}

struct FavorisButton: View {
    
    let experience: Experience
    @EnvironmentObject var favorisManager: FavorisManager
    @State var isLike: Bool
    func toggle() {
        if isLike {
            favorisManager.removeFavoris(experience: experience)
        } else {
            favorisManager.addFavoris(experience: experience)
        }
        isLike = favorisManager.isLike(experience: experience)
    }
    var body: some View {
        Button(action:
            withAnimation(.spring()){
                toggle
            }
        , label: {
            Circle()
                .frame(width: 50, height: 30)
                .foregroundColor( .white)
                .overlay(
                    Image(systemName: isLike ? "heart.fill" : "heart")
                        .foregroundColor(isLike ? Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)) : .customPrimary)
                )
        })
    }
}

struct ExperienceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetails(experience: MOCK_EXPERIENCES[0])
            .previewLayout(.sizeThatFits).environmentObject(FavorisManager())
    }
}
