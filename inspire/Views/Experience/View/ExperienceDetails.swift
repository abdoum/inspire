//
//  ExperienceDetails.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceDetails: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var active = true
    let experiences: Experience
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        VStack {
                            Image(experiences.category.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .listRowInsets(EdgeInsets())
                            VStack {
                                AuthorMainInfos(imageName: experiences.author.avatar, fullName: "\(experiences.author.firstname) \(experiences.author.lastname.uppercased())", specialisation: experiences.category.specialisations, rate: experiences.rate)
                                ExperienceContact(language: experiences.author.spokenLanguages)
                                    .padding(.leading).padding(.trailing)
                                ExperienceProgram(experiences.description, lineLimit: 6)
                                UserNeeds()
                                ExperienceReviews()
                            }
                            .padding()
                        }
                    }
                    ExperiencePriceDates(experiences: MOCK_EXPERIENCES[0])
                }
            }.navigationBarItems(leading:
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
                                        Button(action: {
                                            //add to FavorisView
                                        }, label: {
                                            Circle()
                                                .frame(width: 50, height: 30)
                                                .foregroundColor(.white)
                                                .overlay(
                                                    Image(systemName: "heart")
                                                        .foregroundColor(.black)
                                                )
                                        }) )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ExperienceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetails(experiences: MOCK_EXPERIENCES[0])
    }
}
