//
//  InfosHeaderPRofileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct InfosHeaderPRofileView: View {
    var body: some View {
        HStack {
            Image("maria_lopez")
                .resizable()
                .frame(width: 110, height: 110)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            VStack {
                Text("Maria Lopez")
                    .font(.title.bold())
                Text("Serveuse")
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
        InfosHeaderPRofileView()
    }
}
