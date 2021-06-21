//
//  Suggestion.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct Suggestion: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var quiz : Quiz
    var experience : Experience
    var body: some View {
        
        Image(experience.category.image)
            .resizable()
            .scaledToFill()
            .frame(width: 270, height: 460, alignment: .center)
            .overlay(Color.black.opacity(0.3))
            .cornerRadius(14)
            .shadow(radius: 10)
            .overlay(
                VStack(alignment: .leading){
                    Text(experience.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                    RatingLine(averageRating: experience.averageRate, commentsCount: 328, color: .white)
                        .padding(.vertical, 2)
//                    DurationLine(duration: experience, color: .white)
                        .padding(.vertical, 2)
                    PriceView(price: experience.price, color: .white)
                        .padding(.vertical, 2)
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 90, height: 46)
                        .foregroundColor(.white)
                        .overlay(
                            
                            Text("Voir")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.customPrimary)
                                .padding()
                            
                            
                            //                                    })
                            
                        )
                        
                        .padding(.vertical)
                    
                }
                .alignmentGuide(HorizontalAlignment.leading) { _ in  80 }
            )
        
    }
    
}


struct Suggestion_Previews: PreviewProvider {
    static var previews: some View {
        Suggestion(experience: MOCK_EXPERIENCES[6])
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
