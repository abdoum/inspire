//
//  RatingLine.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct RatingLine: View {
    let averageRating : Double
    let commentsCount :  Int
    let color : Color
    var body: some View {
        HStack {
            Label(
                title: {
                    Text(String(averageRating))
                        .font(.callout)
                        .fontWeight(.medium)
                    Text("(\(String(commentsCount)))")
                        .font(.callout)
                        .fontWeight(.thin)
                },
                icon: {
                    Image(systemName: "star.fill")
                        .font(.callout)
                }
            ).foregroundColor(color)
        }
    }
}

//struct RatingLine_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingLine()
//    }
//}
