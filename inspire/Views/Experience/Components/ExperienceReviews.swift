//
//  ExperienceReviews.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceReviews: View {

    let review : Review
    let rate : Double
    
    var body: some View {
        VStack {
            HStack {
                Text("Les avis")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("Note: \(rate, specifier: "%.1f")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Spacer()
                HStack {
                    Spacer()
                }
            }
            HStack {
                Image(review.author.avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text("\(review.author.firstname) \(review.author.lastname)")
                    Text("12 Décembre 2021")
                        .font(.footnote)
                }.padding(.horizontal, 16)
                Spacer()
            }
            HStack {
                Text("\(review.comment ?? "")")
                Spacer()
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct ExperienceReviews_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceReviews(review: MOCK_EXPERIENCES[0].reviews[0], rate: 3.7)
    }
}
