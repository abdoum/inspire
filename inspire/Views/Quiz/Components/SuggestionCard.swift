//
//  ExperienceCard.swift
//  inspire
//
//  Created by ab on 11/06/2021.
//

import SwiftUI

struct SuggestionCard: View {
    var experience : Experience
    var body: some View {
        VStack(alignment: .center) {
            
            ZStack {
                Image("experience.imageName")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                if experince.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)                }
                
                VStack(alignment: .leading) {
                    Text("experience.reviews")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(1)
                    Text("experience.title")
                        .padding(1)
                        .foregroundColor(.gray)
                    Text("experience.price +  €")
                        .padding(1)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .foregroundColor(.black)
            
            .padding(.bottom, 30)
        }
    }
}

// struct ExperienceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        SuggestionCard(experience: <#Experience#>)
//    }
//}
