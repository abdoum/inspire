//
//  InfosHeaderPRofileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct InfosHeaderPRofileView: View {
    
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
            VStack {
                Text(fullName)
                    .font(.title.bold())
                Text(job)
                    .font(.subheadline)
                    .padding(.trailing, 90)
                    .padding(.top, 1)
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.65")
                    Text("(16 avis)")
                        .underline()
                        .font(.subheadline)
                }
                .padding(.top)
                .offset(x: -15)
            }
        }
        .offset(x: -50)
    }
}

struct InfosHeaderPRofileView_Previews: PreviewProvider {
    static var previews: some View {
        InfosHeaderPRofileView(imageName: "maria_lopez", fullName: "Maria Lopez", job: "Serveuse")
    }
}