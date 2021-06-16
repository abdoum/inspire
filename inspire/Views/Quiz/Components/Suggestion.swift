//
//  Suggestion.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct Suggestion: View {
    var body: some View {
        
        ZStack {
            Image("chocolatier_confiseur")
                .resizable()
                .scaledToFill()
                .frame(width: 270, height: 460, alignment: .center)
                .overlay(Color.black.opacity(0.3))
                .cornerRadius(14)
                .shadow(radius: 10)
            VStack(alignment: .leading){
                Text("Chocolatier")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                RatingLine(averageRating: 4.89, commentsCount: 328, color: .white)
                    .padding(.vertical, 2)
                DurationLine(duration: 5890, color: .white)
                    .padding(.vertical, 2)
                Price(price: 75, color: .white)
                    .padding(.vertical, 2)
                NavigationLink(destination:
                    // TODO: implement navigation to a specific experience
                    ExperienceDetail()
                , label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 90, height: 46, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(
                            Text("Voir")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.customPrimary)
                                .padding()
                    )
                })
            }
            .alignmentGuide(HorizontalAlignment.leading) { _ in  80 }
        }
    }
}

struct Suggestion_Previews: PreviewProvider {
    static var previews: some View {
        Suggestion()
    }
}