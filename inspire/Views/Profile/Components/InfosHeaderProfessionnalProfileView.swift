//
//  InfosHeaderProfessionnalProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct InfosHeaderProfessionnalProfileView: View {
    
    let imageName: String
    let fullName: String
    let job: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 110, height: 110)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.leading)
            Spacer()
            VStack (alignment: .leading){
                Text(fullName)
                    .font(.title)
                    .bold()
                Text(job)
                    .font(.subheadline)
                    .padding(.top, 1)
                RatingLine(averageRating: 4.89, commentsCount: 328, color: .customPrimary)
                    .padding(.top, 10)
            }
            .offset(x: -80)
        }
    }
}

struct InfosHeaderPRofileView_Previews: PreviewProvider {
    static var previews: some View {
        InfosHeaderProfessionnalProfileView(imageName: "maria_lopez", fullName: "Maria Lopez", job: "Serveuse")
    }
}
