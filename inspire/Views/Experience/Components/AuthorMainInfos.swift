//
//  AuthorMainInfos.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct AuthorMainInfos: View {
    
    let author: User
    let category : ExperienceCategory
    let rate : String
    let reviews: [Review]
    func button(imageName: String, action: Void) -> some View {
        Button(action: {
            action
        }) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25.0, height: 25.0)
                .foregroundColor(.black)
                .opacity(0.8)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            //------------HEAD------------------
            HStack {
                Image(author.avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80.0, height: 80.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(author.firstname) \(author.lastname)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    Text(category.specialisation)
                        .padding(.top)
                }.padding(.leading)
                Spacer()
            }
            //------------SUBHEAD---------------
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Text(" \(Double(rate) ?? 1.0, specifier: "%.1f")")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Button(action: {}) {
                        Text("(\(reviews.count))")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                    }
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 30.0)
                        .foregroundColor(.black.opacity(0.5))
                        
                        .overlay(
                            Text(category.specialisation)
                                .foregroundColor(.white)
                        )
                        .padding()
                }
//                .padding(.bottom, 10)
                //Solo ---- Group ---- Visio
//                HStack(alignment: .center) {
//                    button(imageName: "person", action: ())
//                    Spacer()
//                    button(imageName: "person.3", action: ())
//                    Spacer()
//                    button(imageName: "video", action: ())
//                }
//                .padding([.horizontal, .trailing], 40)
            }
 //--------RATE-------
            Divider()
            VStack {
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                        .opacity(0.5)
                    Text(" Paris, France")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }
            }
            Divider()
        }
        .padding(.horizontal, 20)
    }
}

struct AuthorMainInfos_Previews: PreviewProvider {
    static var previews: some View {
        AuthorMainInfos(author: MOCK_EXPERIENCES[0].author, category: MOCK_EXPERIENCES[0].category, rate: MOCK_EXPERIENCES[0].rate, reviews: MOCK_EXPERIENCES[0].reviews)
    }
}
