//
//  ExperienceReviews.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceReviews: View {

    let reviews : [Review]
    
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
                Text("Note: \(reviews[0].rate)/5")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("(\(reviews.count))")
                Spacer()
                HStack {
                    Spacer()
                }
            }
            HStack {
                Image(reviews[0].author.avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text("\(reviews[0].author.firstname) \(reviews[0].author.lastname)")
                    Text("12 Décembre 2021")
                        .font(.footnote)
                }.padding(.horizontal, 16)
                Spacer()
            }
            HStack {
                Text("Expérience incroyable, vécue en immersion totale avec une personne charismatique m'engageant à rejoindre cette corporation sans délai. Merci encore et à très vite !")
     //           Text("\(reviews[0].comment ?? "")")
                Spacer()
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct ExperienceReviews_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceReviews(reviews: MOCK_EXPERIENCES[0].reviews)
    }
}
